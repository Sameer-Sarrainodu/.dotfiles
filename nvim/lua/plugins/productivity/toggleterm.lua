-- lua/plugins/productivity/toggleterm.lua
require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15 -- Height of bottom panel
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl-\
	direction = "horizontal", -- Docked bottom panel
	-- direction = "float", -- Uncomment for floating bottom panel
	float_opts = {
		border = "curved",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.4),
		winblend = 0,
	},
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	close_on_exit = true,
})

-- Keymap to open Terminal tab
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
