
-- lua/lsp.lua
-- Native LSP loader with Mason + Blink CMP

local blink = require("blink.cmp")
local capabilities = blink.get_lsp_capabilities() -- for completion

-- Diagnostics configuration
vim.diagnostic.config({
    virtual_lines = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN]  = "󰀪",
            [vim.diagnostic.severity.INFO]  = "󰋽",
            [vim.diagnostic.severity.HINT]  = "󰌶",
        },
    },
})

-- Utility function to start an LSP server
local function start_lsp(name, cmd, filetypes, root_dir, settings)
    vim.lsp.start_client({
        name = name,
        cmd = cmd,
        root_dir = root_dir or vim.loop.cwd(),
        capabilities = capabilities,
        filetypes = filetypes,
        settings = settings,
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
    })
end

-- Load all servers from lua/lsp-servers/
local servers = {
    "lua_ls",
    "pyright",
}

for _, server in ipairs(servers) do
    local ok, config = pcall(require, "lsp-servers." .. server)
    if ok and type(config) == "table" then
        start_lsp(
            config.name,
            config.cmd,
            config.filetypes,
            config.root_dir,
            config.settings
        )
    else
        vim.notify("Failed to load LSP config: " .. server, vim.log.levels.WARN)
    end
end
