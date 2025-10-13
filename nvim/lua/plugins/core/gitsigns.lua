require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	numhl = false,
	linehl = false,
	watch_gitdir = { interval = 1000, follow_files = true },
	current_line_blame = true,

	-- Move keymaps inside on_attach
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local opts = { buffer = bufnr, noremap = true, silent = true }

		-- Navigation
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			gs.next_hunk()
		end, { expr = true, buffer = bufnr })
		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			gs.prev_hunk()
		end, { expr = true, buffer = bufnr })

		-- Actions
		vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts)
		vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
		vim.keymap.set("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.visualmode() })
		end, opts)
		vim.keymap.set("v", "<leader>hr", gs.reset_hunk, opts)
		vim.keymap.set("n", "<leader>hS", gs.stage_buffer, opts)
		vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)
		vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
		vim.keymap.set("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, opts)
	end,
})
