require("onedarkpro").setup({
    colors = {
    },
    options = {
        cursorline=true,
        transparency=true,
        highlight_inactive_windows=true
    }
})

function ColorMyPencils()
	vim.o.termguicolors = true
    vim.cmd("colorscheme onedark")

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
