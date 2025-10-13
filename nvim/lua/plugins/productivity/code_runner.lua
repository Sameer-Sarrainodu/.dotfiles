-- lua/plugins/productivity/code_runner.lua
require("code_runner").setup({
	filetype = {
		python = {
			"python3",
		},
	},
	term = {
		position = "below", -- Use Toggleterm's bottom panel
		size = 15,
	},
	-- Optional: Floating window for output
	-- float = {
	--   border = "curved",
	--   height = 0.4,
	--   width = 0.8,
	-- },
})

-- Keymap to run code
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run Code" })
