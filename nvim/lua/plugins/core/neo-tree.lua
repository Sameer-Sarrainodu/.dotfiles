-- ~/.config/nvim/lua/plugins/core/neo-tree.lua
require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = { "node_modules", "__pycache__" },
		},
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		width = 32,
		mappings = {
			["<space>"] = "toggle_node",
			["<cr>"] = "open",
			["S"] = "split_with_window_picker",
			["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			["C"] = "close_node",
			["R"] = "refresh",
		},
	},
	default_component_configs = {
		indent = { padding = 0 },
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
		},
	},
})

-- ==========================
-- 🔑 Plugin-specific keymap
-- Example: toggle Neo-tree with <leader>e
-- ==========================
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
