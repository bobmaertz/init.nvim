-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }

    use("nvim-treesitter/nvim-treesitter-context");
    use("nvim-treesitter/playground")

    --Navigation
    use {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use("christoomey/vim-tmux-navigator")


    use("mbbill/undotree")
    use("folke/zen-mode.nvim")

    use("tpope/vim-commentary")

    -- DAP
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("leoluz/nvim-dap-go")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-neotest/nvim-nio")

    -- Git Integration
    use("tpope/vim-fugitive")
    use("airblade/vim-gitgutter")

    -- Copilot
    use("github/copilot.vim")
    use(
      "CopilotC-Nvim/CopilotChat.nvim"
      --   build = "make tiktoken", -- Only on MacOS or Linux
    )

    --LSP Support
    use("williamboman/mason.nvim")
    use("neovim/nvim-lspconfig")
    use("williamboman/mason-lspconfig.nvim")

    -- Autocompletion
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua") -- LSP Source for nvim-cpm

    -- Snippets
    use("L3MON4D3/LuaSnip")             -- snippet plugin
    use("saadparwaiz1/cmp_luasnip")     -- Snippets source for nvim-cmp
    use("rafamadriz/friendly-snippets") -- Snippets collection for VSCode like snippets


    -- Testing
    use {
        "vim-test/vim-test",
        --        requires = { { 'preservim/vimux' } }
    }


    -- File explorer - bridge until i can kick the iDE habits
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
