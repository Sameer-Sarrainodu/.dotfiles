
-- lua/test_plugins.lua
-- Plugin Runtime Test

local results = {}

-- Colorscheme
results["Colorscheme"] = pcall(function() vim.cmd.colorscheme("gruvbox-material") end) and "✅ Working" or "❌ Failed"

-- Blink CMP
results["Blink CMP"] = pcall(function() require("blink.cmp") end) and "✅ Working" or "❌ Failed"

-- Treesitter
results["Treesitter"] = pcall(function() require("plugins-config.treesitter") end) and "✅ Working" or "❌ Failed"

-- Comment.nvim
results["Comment.nvim"] = pcall(function() require("Comment") end) and "✅ Working" or "❌ Failed"

-- LSP
results["LSP"] = pcall(function() 
    local clients = vim.lsp.get_clients()
    if #clients == 0 then error("No active LSP clients") end
end) and "✅ Working" or "❌ Failed"

-- ToggleTerm
results["ToggleTerm"] = pcall(function() require("toggleterm") end) and "✅ Working" or "❌ Failed"

-- Conform
results["Conform"] = pcall(function() 
    local conform = require("conform")
    -- Call format_buffer if available
    if conform.format_buffer then
        conform.format_buffer()
    end
end) and "✅ Working" or "❌ Failed"

-- Print results
print("===== Plugin Runtime Test Results =====")
for plugin, result in pairs(results) do
    print(plugin .. ": " .. result)
end
print("======================================")
