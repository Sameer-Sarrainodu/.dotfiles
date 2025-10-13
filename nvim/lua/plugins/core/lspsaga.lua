local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	return
end

saga.setup({
	-- UI settings
	ui = {
		border = "rounded",
		title = true,
		code_action = "",
	},

	-- Diagnostic settings
	diagnostic = {
		on_insert = false, -- safer: don’t update diagnostics in insert mode
		show_code_action = true,
		show_source = true,
		jump_num_shortcut = true,
	},

	-- Code action settings
	code_action = {
		num_shortcut = true,
		show_server_name = true,
		extend_gitsigns = true,
	},

	-- Lightbulb settings (safe version)
	lightbulb = {
		enable = true,
		enable_in_insert = false, -- safer: prevent "line out of range"
		sign = true,
		virtual_text = true,
		ignore = {}, -- prevent 'ignore' function errors
	},

	-- Finder & Hover
	finder = {
		max_height = 0.5,
		keys = {
			jump_to = "p",
			expand_or_jump = "o",
			quit = "q",
		},
	},

	-- Symbol Outline / LSP symbols
	symbol_in_winbar = {
		enable = false,
	},
})

-- Optional: safe lightbulb update autocmd (works even if buffer is empty)
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		pcall(require("lspsaga.codeaction.lightbulb").update_lightbulb)
	end,
})
