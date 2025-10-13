-- ~/.config/nvim/lua/plugins/core/lualine.lua
local lualine = require("lualine")

-- ==============================================
-- 🧠 Friendly LSP + Formatter Status Component
-- ==============================================
local function lsp_info()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	local lsps, formatters = {}, {}

	for _, client in ipairs(clients) do
		-- Detect formatter-like clients (null-ls, stylua, conform, etc.)
		if client.name:match("null%-ls") or client.name:match("stylua") or client.name:match("conform") then
			table.insert(formatters, client.name)
		else
			table.insert(lsps, client.name)
		end
	end

	-- Choose emojis
	local lsp_icon = (#lsps > 0) and "😊" or "😐"
	local fmt_icon = (#formatters > 0) and "🪶" or "💤"

	return lsp_icon .. " " .. fmt_icon
end

-- ==============================================
-- 🖱️ Click handler: show active LSPs & formatters
-- ==============================================
local function show_lsp_details()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	if #clients == 0 then
		vim.notify("No LSP or Formatter attached 😐", vim.log.levels.INFO, { title = "LSP Info" })
		return
	end

	local lsp_names, fmt_names = {}, {}

	for _, client in ipairs(clients) do
		if client.name:match("null%-ls") or client.name:match("stylua") or client.name:match("conform") then
			table.insert(fmt_names, client.name)
		else
			table.insert(lsp_names, client.name)
		end
	end

	local msg = ""
	if #lsp_names > 0 then
		msg = msg .. "😊 LSP: " .. table.concat(lsp_names, ", ") .. "\n"
	else
		msg = msg .. "😐 No LSP\n"
	end

	if #fmt_names > 0 then
		msg = msg .. "🪶 Formatter: " .. table.concat(fmt_names, ", ")
	else
		msg = msg .. "💤 No Formatter"
	end

	vim.notify(msg, vim.log.levels.INFO, { title = "Attached Clients" })
end

-- ==============================================
-- ⚙️ Lualine Setup
-- ==============================================
lualine.setup({
	options = {
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		icons_enabled = true,
		globalstatus = true,
		disabled_filetypes = { "neo-tree" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {
			{
				lsp_info,
				on_click = function(_, _, _)
					show_lsp_details()
				end,
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = {
			{
				"tabs",
				mode = 2,
				tabs_color = {
					active = "lualine_a_normal",
					inactive = "lualine_a_inactive",
				},
			},
		},
	},
	extensions = { "neo-tree" },
})
