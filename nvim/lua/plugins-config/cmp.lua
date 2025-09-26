
-- lua/plugins-config/cmp.lua
return function()
    -- Load Blink CMP
    local blink = require("blink.cmp")

    blink.setup({
        snippets = { preset = "luasnip" },
        signature = { enabled = true },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "normal",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                cmdline = {
                    min_keyword_length = 2,
                },
            },
        },
        keymap = {
            ["<C-f>"] = {},
        },
        cmdline = {
            enabled = false,
            completion = { menu = { auto_show = true } },
            keymap = {
                ["<CR>"] = { "accept", "fallback" },
                ["<C-f>"] = { "scroll_docs_up", "fallback" },
                ["<C-d>"] = { "scroll_docs_down", "fallback" },
            },
        },
        completion = {
            menu = {
                border = nil,
                scrolloff = 1,
                scrollbar = false,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                        { "source_name" },
                    },
                },
            },
            documentation = {
                window = {
                    border = nil,
                    scrollbar = false,
                    winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                },
                auto_show = true,
                auto_show_delay_ms = 500,
            },
        },
    })

    -- Load VSCode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Optional: expose LSP capabilities for servers
    _G.lsp_capabilities = blink.get_lsp_capabilities()
end
