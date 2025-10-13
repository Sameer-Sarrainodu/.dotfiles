-- ~/.config/nvim/lua/config/autocmds.lua
local api = vim.api

-- =====================================================
-- 1️⃣ Highlight on yank
-- =====================================================
api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- =====================================================
-- 2️⃣ Auto reload files changed outside Neovim
-- =====================================================
api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CursorHold" }, {
	pattern = "*",
	command = "checktime",
})

-- =====================================================
-- 3️⃣ Trim trailing whitespace on save
-- =====================================================
api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- =====================================================
-- 4️⃣ Filetype specific autocmds
-- =====================================================
-- Example: automatically set tab width for specific filetypes
api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua" },
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = true
	end,
})
