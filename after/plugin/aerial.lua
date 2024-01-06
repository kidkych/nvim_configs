require('aerial').setup({
    backends = { "lsp", "treesitter" }
})

vim.keymap.set('n', '<leader>pf', require("telescope").extensions.aerial.aerial, {})
