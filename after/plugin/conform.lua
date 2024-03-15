local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        python = { "black", "isort" },
        cs = { "csharpier" },
        cpp = { "clang_format" }
    },
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
            timeout_ms = 2000,
            lsp_fallback = false
        }
    end,
    formatters = {
        csharpier = {
            cwd = require('conform.util').root_file({ ".editorconfig" }),
            require_cwd = true,
            command = "dotnet",
            prepend_args = function(self, ctx)
                return {"csharpier"}
            end,
            inherit = true
        },
        isort = {
            prepend_args = function(self, ctx)
                return {"--profile", "black"}
            end,
        }
    }
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = false, range = range })
end, { range = true })

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = vim.tbl_keys(require("conform").formatters_by_ft),
--   group = vim.api.nvim_create_augroup('conform_formatexpr', { clear = true }),
--   callback = function()
--     vim.opt_local.formatexpr = 'v:lua.require("conform").formatexpr({ timeout_ms = 1000 })'
--   end,
-- })

_G.formatexpr_wrap = function()
    require('conform').formatexpr({ timeout_ms = 2000, async = true, lsp_fallback = false })
end

vim.o.formatexpr = "v:lua.formatexpr_wrap()"
