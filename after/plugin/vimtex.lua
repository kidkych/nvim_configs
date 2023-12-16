vim.cmd("syntax enable")
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
    out_dir = 'build',
    options = {
        '-shell-escape',
        '-synctex=1'
    }
}

vim.g.vimtex_quickfix_method = 'pplatex'
vim.g.vimtex_quickfix_mode = 0

-- vim.g.vimtex_quickfix_ignore_filters = {
--     '(LaTeX Font)  Font shape',
--     'Underfull',
--     'multiple pdfs with page group included in a single page'
-- }
-- vim.opt.maplocalleader = ","
