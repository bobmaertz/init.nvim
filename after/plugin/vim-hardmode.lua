hardmode = require("hardmode")

vim.keymap.set("n", "<leader>h", function() hardmode.HardMode() end, { remap = false })
vim.keymap.set("n", "<leader>H", function() hardmode.EasyMode() end, { remap = false })
