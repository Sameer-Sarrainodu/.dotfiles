
-- lua/lsp-servers/bashls.lua
return {
    name = "bashls",
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
}
