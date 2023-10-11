local lsp_zero = require('lsp-zero')
local trouble = require('trouble').setup({
    auto_open = true
})

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()

    local opts = { buffer = bufnr }
    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
    vim.keymap.set({ 'n', 'x' }, "gr", function()
        trouble.open("lsp_references")
    end, opts)
    vim.keymap.set({ 'n', 'x' }, "ca", function()
        vim.lsp.buf.code_action()
    end, opts)
end)

-- vim.lsp.set_log_level("debug")

require('mason').setup()
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            jedi = {
                                auto_import_modules = {}
                            },
                            pylsp_black = {
                                enabled = true
                            },
                            autopep8 = {
                                enabled = false
                            },
                            yapf = {
                                enabled = false
                            },
                            pycodestyle = {
                                enabled = false
                            },
                            ruff = {
                                enabled = true,
                                extendSelect = { "I" }
                            },
                            pylsp_mypy = {
                                enabled = true,
                                overrides = { "--python-executable",
                                    "python",
                                    true }
                            }
                        }
                    }
                }
            })
        end
    }
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab()
    }),
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'omni' },
        { name = "nvim_lsp_signature_help" }
    },
    formatting = lsp_zero.cmp_format(),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
}
