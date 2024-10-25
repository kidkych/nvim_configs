vim.keymap.set({ "n", "v" }, "h", "k")
vim.keymap.set({ "n", "v" }, "j", "h")
vim.keymap.set({ "n", "v" }, "k", "j")

vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, ".", "<nop>")

vim.keymap.set("n", "gc", ":tabnew<CR>")

-- Remaining remaps from ThePrimeagen, https://github.com/ThePrimeagen/init.lua
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "H", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v" }, "q:", "<nop>")

vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)
