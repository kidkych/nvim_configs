vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.colorcolumn = "81"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

local osc52 = require("vim.ui.clipboard.osc52")
vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = osc52.copy("+"),
        ["*"] = osc52.copy("*"),
    },
    paste = {
        ["+"] = osc52.paste("+"),
        ["*"] = osc52.paste("*"),
    },
}
