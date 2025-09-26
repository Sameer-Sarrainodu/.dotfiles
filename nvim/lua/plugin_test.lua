
-- plugin_test.lua
-- Test all plugins and key features

local plugins = {
    { name = "nvim-autopairs", test = function()
        local ok, ap = pcall(require, "nvim-autopairs")
        return ok and type(ap.setup) == "function"
    end },
    { name = "telescope", test = function()
        local ok, tel = pcall(require, "telescope.builtin")
        return ok and type(tel.find_files) == "function"
    end },
    { name = "bufferline", test = function()
        local ok, buf = pcall(require, "bufferline")
        return ok and type(buf.setup) == "function"
    end },
    { name = "nvim-tree", test = function()
        local ok, tree = pcall(require, "nvim-tree")
        return ok and type(tree.setup) == "function"
    end },
    { name = "toggleterm", test = function()
        local ok, term = pcall(require, "toggleterm")
        return ok and type(term.setup) == "function"
    end },
    { name = "lualine", test = function()
        local ok, line = pcall(require, "lualine")
        return ok and type(line.setup) == "function"
    end },
    { name = "nvim-treesitter", test = function()
        local ok, ts = pcall(require, "nvim-treesitter.configs")
        return ok and type(ts.setup) == "function"
    end },
    { name = "which-key", test = function()
        local ok, wk = pcall(require, "which-key")
        return ok and type(wk.register) == "function"
    end },
    { name = "trouble", test = function()
        local ok, tr = pcall(require, "trouble")
        return ok and type(tr.setup) == "function"
    end },
    { name = "Comment", test = function()
        local ok, c = pcall(require, "Comment")
        return ok and type(c.setup) == "function"
    end },
    { name = "todo-comments", test = function()
        local ok, tdc = pcall(require, "todo-comments")
        return ok and type(tdc.setup) == "function"
    end },
    { name = "mason", test = function()
        local ok, mason = pcall(require, "mason")
        return ok and type(mason.setup) == "function"
    end },
    { name = "blink.cmp", test = function()
        local ok, blink = pcall(require, "blink.cmp")
        return ok and type(blink.setup) == "function"
    end },
    { name = "conform", test = function()
        local ok, c = pcall(require, "conform")
        return ok and type(c.setup) == "function"
    end },
    { name = "lazydev", test = function()
        local ok, ld = pcall(require, "lazydev")
        return ok
    end },
    { name = "colorscheme", test = function()
        return vim.g.colors_name ~= nil
    end },
}

print("=== Neovim Plugin Health Check ===")
for _, plug in ipairs(plugins) do
    local ok, res = pcall(plug.test)
    local status = (ok and res) and "✅ Loaded" or "❌ Failed"
    print(string.format("%-15s : %s", plug.name, status))
end
print("==================================")
