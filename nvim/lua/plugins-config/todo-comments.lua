-- lua/plugins-config/todo-comments.lua
local todo = require("todo-comments")

todo.setup({
    signs = true,
    keywords = {
        TODO = { icon = " ", color = "info" },
        FIX = { icon = " ", color = "error" },
        HACK = { icon = " ", color = "warning" },
        NOTE = { icon = " ", color = "hint" },
    },
    highlight = {
        keyword = "fg",
        after = "",
    },
})

local map = vim.keymap.set
local opts = { silent = true }

-- Jump between TODOs
map("n", "]t", function() todo.jump_next() end, opts)
map("n", "[t", function() todo.jump_prev() end, opts)

-- Telescope integration (recommended for searching)
if pcall(require, "telescope") then
    map("n", "<leader>xT", function()
        require("telescope").extensions.todo_comments.todo()
    end, opts)
end
