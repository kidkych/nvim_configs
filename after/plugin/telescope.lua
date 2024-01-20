require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "pycache",
            "*.pyc"
        }
    }
}

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

vim.keymap.set('n', '<leader>pp', function()
    builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!.git' } });
end)

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
