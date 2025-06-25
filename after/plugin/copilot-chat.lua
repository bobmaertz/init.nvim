local chat = require("CopilotChat")

-- https://github.com/CopilotC-Nvim/CopilotChat.nvim 
chat.setup{}

vim.keymap.set("n", "<leader>cc", function() chat.open({}) end, {desc = "CopilotChat - Toggle"} )
