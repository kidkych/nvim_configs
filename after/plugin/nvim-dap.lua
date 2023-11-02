require('dap-python').setup(
    '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
)


local dap = require("dap")

dap.adapters.coreclr = {
    type = 'executable',
	command = vim.fn.exepath('netcoredbg'),
	args = { '--interpreter=vscode' }
}

require('dap.ext.vscode').load_launchjs(
    nil,
    {
        cppdbg = { 'cpp' },
        codelldb = { 'cpp' },
        coreclr = { 'cs' }
    }
)

vim.keymap.set("n", "<leader>dd", dap.continue, {})
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dt", dap.terminate, {})

local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

vim.keymap.set("n", "<leader>do", dapui.open, {})
vim.keymap.set("n", "<leader>dc", dapui.close, {})
