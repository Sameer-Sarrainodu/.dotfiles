-- lua/plugins/themes.lua
return {
	-- Popular colorschemes
	{ "sainnhe/gruvbox-material" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "sainnhe/everforest" },
	{ "joshdick/onedark.vim" },
	{ "Mofiqul/vscode.nvim", name = "vscode" },

	-- Themery plugin for interactive theme switching
	{
		"zaldih/themery.nvim",
		config = function()
			require("themery").setup({
				themes = {
					-- Gruvbox flavors
					"gruvbox-material",
					-- Catppuccin flavors
					"catppuccin-latte",
					"catppuccin-frappe",
					"catppuccin-macchiato",
					"catppuccin-mocha",

					-- Tokyonight flavors
					"tokyonight-storm",
					"tokyonight-night",
					"tokyonight-day",
					"tokyonight-moon",

					-- Kanagawa flavors
					"kanagawa-wave",
					"kanagawa-lotus",
					"kanagawa-dragon",

					-- Rose-pine flavors
					"rose-pine",
					"rose-pine-moon",
					"rose-pine-dawn",

					-- Other single-flavor themes
					"everforest",
					"onedark",
					"vscode",
				},
				preview = {
					width = 50,
					height = 20,
				},
			})

			-- Keymap to open Themery
			vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>Themery<CR>", { noremap = true, silent = true })
		end,
	},
}
