require('mason').setup()

local venv_path = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
require('mason-nvim-dap').setup({
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
        python = function(config)
            config.configurations = {
                {
                    type = 'python',
                    request = 'launch',
                    name = 'Python: Launch file',
                    program = '${file}',
                    pythonPath = venv_path and (venv_path .. '/bin/python') or nil,
                    console = 'integratedTerminal'
                }
            }
            require('mason-nvim-dap').default_setup(config)
        end,
        --        cppdbg = function(config)
        --            config.configurations = {}
        --            require('mason-nvim-dap').default_setup(config)
        --        end,
    }
})

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
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
