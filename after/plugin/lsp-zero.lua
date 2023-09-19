local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
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
        { name = 'omni' }
    },
    formatting = lsp_zero.cmp_format()
}
