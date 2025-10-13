-- ~/.config/nvim/lua/plugins.lua
-- Main Lazy.nvim plugin loader

local plugins = {
	-- 1️⃣ Plenary (core dependency for many plugins)
	{
		"nvim-lua/plenary.nvim",
		lazy = false, -- always loaded
	},
	-- 2️⃣ Web Dev Icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false, -- always loaded, because many plugins depend on it
		default = true,
	},
	-- 🪵 Neo-tree (modern file explorer)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.core.neo-tree")
		end,
	},
	-- bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			require("plugins.core.bufferline")
		end,
	},

	-- Lualine.nvim (statusline)
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.core.lualine")
		end,
	},

	-- Treesitter for syntax highlighting and textobjects
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"nvim-treesitter/playground",
				cmd = "TSPlaygroundToggle",
			},
		},

		config = function()
			require("plugins.core.treesitter")
		end,
	},

	-- Telescope.nvim (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		lazy = false, -- load immediately for keymaps/commands
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.core.telescope")
		end,
	},
	-- Mason.nvim (LSP / linter / formatter installer)
	{
		"williamboman/mason.nvim",
		lazy = false, -- load immediately so :Mason works
		config = function()
			require("plugins.core.mason")
		end,
	},
	-- Mason LSP config helper
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false, -- load immediately with mason
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("plugins.core.mason-lspconfig")
		end,
	},
	-- nvim-lspconfig (connects Neovim with installed LSP servers)
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("plugins.core.lsp")
		end,
	},
	-- lspsaga
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.core.lspsaga")
		end,
	},
	-- nvim-cmp + LuaSnip
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
		event = "InsertEnter",
		config = function()
			require("plugins.core.cmp")
		end,
	},

	-- Conform (formatter/linter)
	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			require("plugins.core.conform")
		end,
	},
	-- lspkind
	{
		"onsails/lspkind.nvim",
		lazy = false,
	},

	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "DAP Continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
		},
		config = function()
			require("plugins.core.dap")
		end,
	},

	-- nvim-dap-ui
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		lazy = true,
		config = function()
			require("plugins.core.dap-ui")
		end,
	},
	-- nvim nio
	{
		"nvim-neotest/nvim-nio",
		lazy = false, -- core plugin, loaded immediately
	},

	-- gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("plugins.core.gitsigns")
		end,
	},

	--autopairs
	{
		"windwp/nvim-autopairs",
		lazy = false,
		config = function()
			require("plugins.productivity.autopairs")
		end,
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("plugins.productivity.comment")
		end,
	},
	--neoscroll
	{
		"karb94/neoscroll.nvim",
		lazy = false,
		config = function()
			require("plugins.productivity.neoscroll")
		end,
	},
	-- vim-sneak
	{
		"justinmk/vim-sneak",
		lazy = false,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plugins.productivity.toggleterm")
		end,
	},
	-- trouble

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.productivity.trouble")
		end,
		keys = {
			{ "<leader>xx", "<cmd>Trouble toggle<cr>", desc = "Toggle Trouble" },
			{ "<leader>xX", "<cmd>TroubleToggle<cr>", desc = "Buffer Diagnostics Trouble" },
		},
		cmd = "Trouble",
	},
	-- coderunner
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("plugins.productivity.code_runner")
		end,
	},
}
-- -- Merge themes into main plugin table
local themes = require("plugins.themes")
vim.list_extend(plugins, themes)

-- Setup Lazy.nvim
require("lazy").setup(plugins, {
	install = { missing = true },
	checker = { enabled = true, notify = false },
	performance = {
		rtp = { disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" } },
	},
	ui = {
		border = "rounded", -- options: "none", "single", "double", "rounded", "solid", "shadow"
		size = {
			width = 0.8, -- 80% of screen width
			height = 0.8, -- 80% of screen height
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal", -- border matches theme
		},
	},
})
