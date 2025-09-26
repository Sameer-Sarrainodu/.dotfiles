-- lua/plugins-config/comment.lua
require("Comment").setup({
    -- Keymaps config
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    opleader = {
        line = "gc",
        block = "gb",
    },
    extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
    },
    mappings = {
        basic = true,       -- ggc, gbG, etc.
        extra = true,       -- gco, gcO, gcA
    },
    pre_hook = nil,
    post_hook = nil,
})
