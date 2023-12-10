

-- Dap  
vim.keymap.set('n', '<F1>', '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F2>', '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<F3>', '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set('n', '<leader>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
vim.keymap.set('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>')
--vim.keymap.set('n', '<leader>dt', '<cmd>lua require"dap".debug_test()<CR>') 

require('dap-go').setup()
require('dapui').setup()
require('nvim-dap-virtual-text').setup()


