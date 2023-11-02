require("barbar").setup({
    sidebar_filetypes = {
        NvimTree = true
    }
})

vim.keymap.set("n", "<C-c>", "<Cmd>BufferClose<CR>")
vim.keymap.set("n", "<C-b>", "<Cmd>BufferPick<CR>")
