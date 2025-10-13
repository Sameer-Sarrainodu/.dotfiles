-- lua/plugins/core/dapui.lua
local dapui = require("dapui")

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom", -- Bottom panel for Debug tab
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "rounded",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})
