vim.g.loaded_netrw = 1
vim.g.loaded_netwrPlugin = 1

require("nvim-tree").setup({
    modified={
        enable=true
    }
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle <CR>")
