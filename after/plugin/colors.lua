require("onedarkpro").setup({
    colors = {
    },
    options = {
        cursorline = true,
        transparency = true,
        highlight_inactive_windows = true
    },
    highlights = {
        IlluminatedWordText = { link = "Visual" },
        IlluminatedWordRead = { link = "Visual" },
        IlluminatedWordWrite = { link = "Visual" },
    },
})

require('illuminate').configure({
    filetypes_denylist = {
        'NvimTree',
        'dirbuf',
        'dirvish',
        'fugitive',
    }
})

function ColorMyPencils()
    vim.o.termguicolors = true
    vim.cmd("colorscheme onedark")

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
require('colorizer').setup()
