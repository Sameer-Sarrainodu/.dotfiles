
-- lua/lsp-servers/pyright.lua
-- Pyright configuration for Python
return {
    name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
