local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "olimorris/onedarkpro.nvim"
    use "norcalli/nvim-colorizer.lua"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }
    use "nvim-treesitter/playground"

    use "theprimeagen/harpoon"
    use "mbbill/undotree"
    use "tpope/vim-fugitive"

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use 'Hoffs/omnisharp-extended-lsp.nvim'
    use 'RRethy/vim-illuminate'
    use 'hrsh7th/cmp-omni'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'

    use 'folke/trouble.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'lervag/vimtex'
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use 'ojroques/nvim-osc52'
    use 'Vimjas/vim-python-pep8-indent'

    use 'stevearc/conform.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'simrat39/symbols-outline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'HiPhish/rainbow-delimiters.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
