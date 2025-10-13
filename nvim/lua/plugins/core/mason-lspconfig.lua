-- ~/.config/nvim/lua/plugins/core/mason-lspconfig.lua

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"ts_ls",
	},
	automatic_installation = true,
})
