local lsp_zero = require('lsp-zero')
local trouble = require('trouble')

vim.keymap.set({'n', 'x'}, "gp", function()
    trouble.toggle('document_diagnostics')
end)

trouble.setup({
    auto_open = true,
    mode = "document_diagnostics"
})

vim.diagnostic.config({
    virtual_text = false,
})

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr }
    vim.keymap.set({ 'n', 'x' }, "gr", function()
        trouble.open("lsp_references")
    end, opts)
    vim.keymap.set({ 'n', 'x' }, "ca", function()
        vim.lsp.buf.code_action()
    end, opts)
end)

require('mason').setup()
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            jedi = { auto_import_modules = {} },
                            autopep8 = { enabled = false },
                            mccabe = { enabled = false },
                            pycodestyle = { enabled = false },
                            pyflakes = { enabled = false },
                            yapf = { enabled = false }
                        }
                    }
                }
            })
        end,
        -- omnisharp = function()
        --     require('lspconfig').omnisharp.setup({
        --         handlers = {
        --             ["textDocument/definition"] =
        --                 require('omnisharp_extended').handler
        --         },
        --         enable_roslyn_analyzers = true,
        --         analyze_open_documents_only = true,
        --         cmd = { 'omnisharp' }
        --     })
        -- end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end
    }
})

require("roslyn").setup({
    dotnet_cmd = "/usr/bin/dotnet",
    roslyn_version = "4.8.0-3.23475.7",
    on_attach = lsp_zero.on_attach,
    capabilities = lsp_zero.get_capabilities()
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
