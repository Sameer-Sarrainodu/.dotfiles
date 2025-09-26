
-- Extend Blink sources with LazyDev integration
require("blink.cmp").setup({
    sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100, -- prioritize
            },
        },
    },
})
