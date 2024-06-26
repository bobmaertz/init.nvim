-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- Shortcut to toggle the NvimTree
vim.keymap.set('n', '<leader>x', ':NvimTreeToggle<CR>', { desc = "NvimTree - Toggle" })
vim.keymap.set('n', '<leader>xf', ':NvimTreeFocus<CR>', { desc = "NvimTree - Focus" })

-- empty setup using defaults
require("nvim-tree").setup();
