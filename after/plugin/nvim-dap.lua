require('mason').setup()
require('mason-nvim-dap').setup({
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
        cppdbg = function(config)
            config.configurations = {}
            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'cpp' }, codelldb = { 'cpp' } })

local dap = require("dap")

vim.keymap.set("n", "<leader>r", dap.continue, {})
vim.keymap.set("n", "<leader>t", dap.toggle_breakpoint, {})

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
