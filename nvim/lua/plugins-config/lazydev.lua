
-- LazyDev configuration
require("lazydev").setup({
    library = {
        -- load luvit types when `vim.uv` is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})
