require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'cpp' }, codelldb = { 'cpp' } })

local dap = require("dap")

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
