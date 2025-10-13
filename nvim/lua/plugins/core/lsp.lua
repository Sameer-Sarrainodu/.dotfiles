-- ~/.config/nvim/lua/plugins/core/lsp.lua
-- =====================================================
-- Neovim LSP Setup using the new API (0.11+)
-- Supports Mason-installed servers, nvim-cmp, and Lspsaga
-- =====================================================

-- Suppress old nvim-lspconfig deprecation warnings
local default_notify = vim.notify
vim.notify = function(msg, level, opts)
	if type(msg) == "string" and msg:match("require%('lspconfig'%)") then
		return
	end
	return default_notify(msg, level, opts)
end

-- Safe require of mason-lspconfig (already ensures servers installed)
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
	return
end

-- =====================================================
-- on_attach function
-- Runs when LSP attaches to a buffer
-- =====================================================
local on_attach = function(client, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	-- Lspsaga mappings
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover doc")
	map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code Action")
	map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics")
	map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "Goto Definition")
	map("n", "gr", "<cmd>Lspsaga finder<CR>", "References / Definition Finder")
	map("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", "Signature Help")

	-- Classic LSP keymaps
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gi", vim.lsp.buf.implementation, "Implementation")

	-- Quickfix / Location list shortcuts
	map("n", "<leader>q", "<cmd>lua vim.diagnostic.setqflist()<CR>:copen<CR>", "Open Quickfix")
	map("n", "<leader>l", "<cmd>lua vim.diagnostic.setloclist()<CR>:lopen<CR>", "Open Location List")
end

-- =====================================================
-- LSP Capabilities
-- Integrates with nvim-cmp for autocompletion
-- =====================================================
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- =====================================================
-- List of servers to setup
-- =====================================================
local servers = { "pyright", "lua_ls", "ts_ls" }

-- =====================================================
-- Configure and enable each LSP server
-- Using Neovim 0.11+ API (vim.lsp.config + vim.lsp.enable)
-- =====================================================
for _, server in ipairs(servers) do
	-- Configure server settings
	vim.lsp.config[server] = {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
	}

	-- Enable the server for buffers
	vim.lsp.enable(server)
end
