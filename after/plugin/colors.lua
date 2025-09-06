-- colorscheme configuration is now handled by lazy.nvim
-- see lua/core/lazy.lua for the rose-pine configuration

-- Optional: Custom color function for enhanced floating windows
function EnhanceFloatingWindows()
	local colors = require('rose-pine.palette')
	
	-- Make floating windows more distinct
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.surface, fg = colors.text })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.surface, fg = colors.rose })
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = colors.surface, fg = colors.iris, bold = true })
	
	-- Enhanced LSP hover
	vim.api.nvim_set_hl(0, "LspInfoBorder", { bg = colors.surface, fg = colors.pine })
	
	-- Make diagnostic floats more visible
	vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = colors.surface, fg = colors.love })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = colors.surface, fg = colors.gold })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = colors.surface, fg = colors.foam })
	vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = colors.surface, fg = colors.iris })
end

-- Optional: Custom color function for transparency (preserves original behavior)
function ColorMyPencils(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Auto-enhance floating windows when colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "rose-pine*",
	callback = function()
		vim.schedule(EnhanceFloatingWindows)
	end,
})