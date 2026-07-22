vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save + source the current file. Lives on <leader>so so <C-s> is free
-- for the builtin LSP signature help (i_CTRL-S, default since 0.11).
vim.keymap.set("n", "<leader>so", ":w | so %<CR>", { desc = "Save and source file" })

-- Move the selected lines up/down, reindenting as they go
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Keep search hits and half-page jumps centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over a selection without clobbering the yank register
vim.keymap.set("x", "<leader>p", [["_dP]])
