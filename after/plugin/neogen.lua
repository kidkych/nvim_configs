require('neogen').setup({
    snippet_engine = "luasnip",
    languages = {
        python = {
            template = {
                annotation_convention = "google_docstrings"
            }
        },
        cs = {
            template = {
                annotation_convention = "xmldoc"
            }
        }
    }
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
    "n",
    "<leader>ds",
    ":lua require('neogen').generate()<CR>",
    opts
)
