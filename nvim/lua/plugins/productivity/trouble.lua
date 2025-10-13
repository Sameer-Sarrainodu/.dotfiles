-- ~/.config/nvim/lua/plugins/productivity/trouble.lua

local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({
	auto_open = false, -- Do not open automatically
	auto_close = true, -- Auto-close when no items
	auto_preview = true, -- Show preview of items
	auto_refresh = true, -- Auto-refresh the list
	use_diagnostic_signs = true, -- Use LSP signs

	fold_open = "", -- Icon for open folds
	fold_closed = "", -- Icon for closed folds

	-- Fix: define icons as a table (not boolean)
	icons = {
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "",
	},

	indent_lines = true, -- Show indent lines
	win = { position = "bottom", height = 15 },
	preview = { type = "main", scratch = true },
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ==========================
-- Diagnostics
-- ==========================
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts) -- workspace
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts) -- current buffer

-- ==========================
-- LSP
-- ==========================
map("n", "<leader>cs", "<cmd>Trouble lsp_document_symbols toggle<cr>", opts)
map("n", "<leader>cl", "<cmd>Trouble lsp_definitions toggle<cr>", opts)
map("n", "<leader>lr", "<cmd>Trouble lsp_references toggle<cr>", opts)
map("n", "<leader>li", "<cmd>Trouble lsp_implementations toggle<cr>", opts)
map("n", "<leader>lt", "<cmd>Trouble lsp_type_definitions toggle<cr>", opts)

-- ==========================
-- Lists
-- ==========================
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
map("n", "<leader>xQ", "<cmd>Trouble quickfix toggle<cr>", opts)

-- ==========================
-- Navigate Trouble items
-- ==========================
map("n", "]t", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", opts)
map("n", "[t", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)
