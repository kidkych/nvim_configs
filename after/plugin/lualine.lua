local colors = require("onedarkpro.helpers").get_colors("onedark")

local onedarkpro = {}

onedarkpro.normal = {
    a = { bg = colors.green, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.green },
    c = { bg = colors.bg_statusline, fg = colors.fg },
}

onedarkpro.insert = {
    a = { bg = colors.blue, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.blue },
}

onedarkpro.command = {
    a = { bg = colors.purple, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.purple },
}

onedarkpro.visual = {
    a = { bg = colors.yellow, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.yellow },
}

onedarkpro.replace = {
    a = { bg = colors.red, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.red },
}

local inactive_bg = colors.bg_statusline

onedarkpro.inactive = {
    a = { bg = inactive_bg, fg = colors.blue },
    b = { bg = inactive_bg, fg = colors.fg_gutter_inactive, gui = "bold" },
    c = { bg = inactive_bg, fg = colors.fg_gutter_inactive },
}

local window = function()
    return vim.api.nvim_win_get_number(0)
end

require('lualine').setup({
    options = {
        theme = onedarkpro
    },
    tabline = {
        lualine_a = {},
        lualine_b = {
            {
                'tabs',
                mode = 2,
                max_length=function() return vim.go.columns end,
            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'branch', 'diff'},
        lualine_z = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {window},
        lualine_b = {'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    -- extensions = {
    --     'nvim-tree'
    -- }
})
