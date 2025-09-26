
-- lua/lsp-servers/lua_ls.lua
local lspconfig_util = require("lspconfig.util")

return {
    name = "lua_ls",
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = function(fname)
        -- Look for a .git or init.lua in the directory chain, fallback to cwd
        return lspconfig_util.root_pattern(".git", "init.lua")(fname) or vim.loop.cwd()
    end,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    },
}
