-- lua/config/colorscheme.lua

-- =============================
-- Persistent Theme Setup
-- =============================

-- Path to store last selected theme
local theme_file = vim.fn.stdpath("data") .. "/last_theme.txt"

-- Function to safely load a theme with fallback
local function safe_colorscheme(name, fallback)
	local ok, _ = pcall(vim.cmd, "colorscheme " .. name)
	if not ok then
		vim.cmd("colorscheme " .. fallback)
	end
end

-- Read last used theme if exists
local last_theme = nil
if vim.fn.filereadable(theme_file) == 1 then
	last_theme = vim.fn.readfile(theme_file)[1]
end

-- Load last theme or default
if last_theme then
	safe_colorscheme(last_theme, "gruvbox-material")
else
	safe_colorscheme("gruvbox-material", "desert")
end

vim.o.background = "dark"

-- =============================
-- Sync Neo-tree background with active theme
-- =============================
local function sync_neotree_theme()
	local ok, normal = pcall(vim.api.nvim_get_hl, 0, { name = "Normal" })
	if ok and normal and normal.bg then
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = normal.bg, fg = normal.fg })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = normal.bg, fg = normal.fg })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = normal.bg, fg = normal.bg })
	end
end

-- Run immediately at startup
sync_neotree_theme()

-- =============================
-- Handle ColorScheme changes
-- =============================
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Save current theme to file
		vim.fn.writefile({ vim.g.colors_name }, theme_file)

		-- Sync Neo-tree
		sync_neotree_theme()

		-- Refresh lualine if loaded
		if package.loaded["lualine"] then
			require("lualine").refresh()
		end
	end,
})
