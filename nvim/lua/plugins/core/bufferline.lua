-- lua/config/bufferline.lua

require("bufferline").setup({
	options = {
		-- Appearance
		indicator = {
			style = "underline", -- Options: 'icon', 'none', 'underline'
		},
		separator_style = "slant", -- Options: 'slant', 'padded_slant', 'slope', 'wave'

		-- LSP Diagnostics
		diagnostics = "nvim_lsp", -- Show LSP diagnostics (errors/warnings)

		-- Offsets for file explorers or side panels
		offsets = {
			{
				filetype = "NvimTree", -- Replace NvimTree with your file explorer's filetype
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},

		-- Other useful options
		always_show_bufferline = true, -- Always show the bufferline, even with one buffer
		show_buffer_close_icons = true,
		show_close_icon = false, -- Only show the close icon on individual buffers
	},
})

-- Switch to next/previous buffer
vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })

-- Close the current buffer
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Close Buffer" })

-- Close all other buffers (keep current open)
vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close Other Buffers" })

-- Pin/Unpin the current buffer
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })

-- Use <leader> + <number> to jump to buffers 1-9
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to Buffer " .. i })
end
