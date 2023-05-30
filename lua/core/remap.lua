vim.g.mapleader = " " 
vim.g.maplocalleader = " " 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end) 


