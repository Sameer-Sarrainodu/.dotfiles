
-- test_plugins_full.lua
-- Script to check plugin loading and keymaps

local results = {}

local function try(name, fn)
    local ok, err = pcall(fn)
    results[name] = ok and "✅ Working" or ("❌ Failed: " .. err)
end

-- Colorscheme
try("Colorscheme", function()
    vim.cmd("colorscheme gruvbox-material")
end)

-- Blink CMP
try("Blink CMP", function()
    local blink = require("blink.cmp")
    blink.get_lsp_capabilities()
end)

-- Treesitter
try("Treesitter", function()
    require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { "lua", "python", "bash" },
        incremental_selection = { enable = true },
    })
end)

-- Comment.nvim
try("Comment.nvim", function()
    require("Comment").setup()
end)

-- LSP
try("LSP", function()
    local clients = vim.lsp.get_active_clients()
end)

-- ToggleTerm
try("ToggleTerm", function()
    local toggleterm = require("toggleterm")
    toggleterm.setup()
end)

-- Conform
try("Conform", function()
    local conform = require("conform")
end)

-- Bufferline
try("Bufferline", function()
    require("bufferline").setup()
end)

-- NvimTree
try("NvimTree", function()
    require("nvim-tree").setup()
end)

-- Todo Comments
try("Todo Comments", function()
    require("todo-comments").setup()
end)

-- Which-Key
try("Which-Key", function()
    require("which-key").setup()
end)

-- Autopairs
try("Autopairs", function()
    require("nvim-autopairs").setup()
end)

-- Blink Extra (if exists)
try("Blink Extra", function()
    local ok, _ = pcall(require, "plugins-config.blink-extra")
end)

-- LazyDev (if exists)
try("LazyDev", function()
    local ok, _ = pcall(require, "plugins-config.lazydev")
end)

-- CMP
try("CMP", function()
    require("plugins-config.cmp")()
end)

-- Print results
print("\n===== Plugin Runtime Test Results =====")
for plugin, status in pairs(results) do
    print(string.format("%-15s : %s", plugin, status))
end
print("======================================")
