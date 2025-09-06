return require('lazy').setup({
  -- Colorscheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        variant = 'moon', -- auto, main, moon, or dawn
        dark_variant = 'moon',
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
        
        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',
          
          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',
          
          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',
          
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
        
        highlight_groups = {
          -- LSP and floating windows
          NormalFloat = { bg = 'surface' },
          FloatBorder = { fg = 'muted', bg = 'surface' },
          FloatTitle = { fg = 'text', bg = 'surface' },
          
          -- LSP specific hover windows
          LspInfoBorder = { fg = 'muted', bg = 'surface' },
          LspSignatureActiveParameter = { fg = 'rose', bg = 'highlight_med' },
          
          -- Diagnostic floating windows
          DiagnosticFloatingError = { fg = 'love', bg = 'surface' },
          DiagnosticFloatingWarn = { fg = 'gold', bg = 'surface' },
          DiagnosticFloatingInfo = { fg = 'foam', bg = 'surface' },
          DiagnosticFloatingHint = { fg = 'iris', bg = 'surface' },
          
          -- Completion menu
          Pmenu = { fg = 'subtle', bg = 'overlay' },
          PmenuSel = { fg = 'text', bg = 'highlight_med' },
          PmenuSbar = { bg = 'highlight_low' },
          PmenuThumb = { bg = 'muted' },
          
          -- Make borders more visible
          WinSeparator = { fg = 'highlight_med' },
          VertSplit = { fg = 'highlight_med' },
          
          -- Telescope improvements
          TelescopeNormal = { bg = 'overlay' },
          TelescopeBorder = { fg = 'muted', bg = 'overlay' },
          TelescopeTitle = { fg = 'text', bg = 'overlay' },
        }
      })
      
      vim.cmd('colorscheme rose-pine')
    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>pg', '<cmd>Telescope git_files<cr>', desc = 'Git files' },
      { '<leader>ps', function()
          require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
        end, desc = 'Grep search' },
      { '<leader>vh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags' },
    },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/playground',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "python", "vimdoc", "javascript", "typescript", "c", "lua", "rust", "go" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  -- Navigation
  {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>a', function() require('harpoon'):list():add() end, desc = 'Harpoon add file' },
      { '<C-e>', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },
      { '<C-j>', function() require('harpoon'):list():select(1) end },
      { '<C-k>', function() require('harpoon'):list():select(2) end },
      { '<C-l>', function() require('harpoon'):list():select(3) end },
      { '<C-;>', function() require('harpoon'):list():select(4) end },
      { '<C-S-P>', function() require('harpoon'):list():prev() end },
      { '<C-S-N>', function() require('harpoon'):list():next() end },
    },
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  -- Utilities
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = { { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Undotree toggle' } },
  },

  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      { '<leader>zz', function()
          require('zen-mode').setup {
            window = {
              width = 90,
              options = {}
            },
          }
          require('zen-mode').toggle()
        end, desc = 'Zen Mode' },
      { '<leader>zZ', function()
          require('zen-mode').setup {
            window = {
              width = 80,
              options = {}
            },
          }
          require('zen-mode').toggle()
        end, desc = 'Zen Mode Narrow' },
    },
  },

  { 'tpope/vim-commentary' },

  -- DAP (Debug Adapter Protocol)
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'leoluz/nvim-dap-go',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
    },
    keys = {
      { '<F1>', function() require('dap').continue() end },
      { '<F2>', function() require('dap').step_over() end },
      { '<F3>', function() require('dap').step_into() end },
      { '<F12>', function() require('dap').step_out() end },
      { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Toggle breakpoint' },
      { '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Conditional breakpoint' },
      { '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = 'Log point' },
      { '<leader>dr', function() require('dap').repl.open() end, desc = 'DAP REPL' },
    },
  },

  -- Git Integration
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G' },
  },

  {
    'airblade/vim-gitgutter',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- Copilot
  {
    'github/copilot.vim',
    event = 'InsertEnter',
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = { 'github/copilot.vim' },
    cmd = 'CopilotChat',
    keys = { { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'Copilot Chat' } },
  },

  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local luasnip = require('luasnip')
      local cmp = require('cmp')
      
      require("luasnip.loaders.from_vscode").lazy_load()
      
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      }
    end,
  },

  -- Testing
  {
    'vim-test/vim-test',
    keys = {
      { '<leader>tf', '<cmd>TestFile<cr>', desc = 'Test file' },
      { '<leader>ts', '<cmd>TestSuite<cr>', desc = 'Test suite' },
      { '<leader>tn', '<cmd>TestNearest<cr>', desc = 'Test nearest' },
      { '<leader>tl', '<cmd>TestLast<cr>', desc = 'Test last' },
      { '<leader>tv', '<cmd>TestVisit<cr>', desc = 'Test visit' },
    },
  },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    keys = {
      { '<leader>x', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree toggle' },
      { '<leader>xf', '<cmd>NvimTreeFocus<cr>', desc = 'NvimTree focus' },
    },
    config = function()
      -- disable netrw at the very start
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true
      -- setup with defaults
      require("nvim-tree").setup()
    end,
  },

  -- Which Key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },
})