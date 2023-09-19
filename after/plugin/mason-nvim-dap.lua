require('mason').setup()
require('mason-nvim-dap').setup{
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
        cppdbg = function(config)
            config.configurations = {
                {
                    name = 'Launch file',
                    type = 'cppdbg',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = false
                },
            }
            require('mason-nvim-dap').default_setup(config)
        end
    }
}
