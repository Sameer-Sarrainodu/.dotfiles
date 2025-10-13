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
					"gruvbox-material",
					"catppuccin",
					"tokyonight",
					"kanagawa",
					"rose-pine",
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
