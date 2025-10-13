require("Comment").setup({
	padding = true, -- Add space between comment and line
	sticky = true, -- Keep commenting on next line
	ignore = "^$", -- Ignore empty lines
})

-- Normal mode
vim.keymap.set(
	"n",
	"<leader>/",
	"<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
	{ desc = "Toggle Comment" }
)
-- Visual mode
vim.keymap.set(
	"x",
	"<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Toggle Comment" }
)
