require("barbar").setup({
    sidebar_filetypes = {
        NvimTree = true
    }
})

vim.keymap.set("n", "<C-c>", "<Cmd>BufferClose<CR>")
vim.keymap.set("n", "<C>n", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<C>e", "<Cmd>BufferNext<CR>")
