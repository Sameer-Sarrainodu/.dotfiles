local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		lua = { "stylua" },
		python = { "black", "isort" },
		yaml = { "/home/sameer/.local/share/nvim/mason/bin/yamlfmt" }, -- guaranteed
	},
	format_on_save = true,
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format current buffer" })
