vim.cmd("syntax enable")
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
    out_dir = 'build',
    options = {
        '-shell-escape',
        '-synctex=1'
    }
}
-- vim.opt.maplocalleader = ","
