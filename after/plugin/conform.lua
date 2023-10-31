local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        cs = { "csharpier" }
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = false
    },
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

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
