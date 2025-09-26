
-- lua/plugins-config/toggleterm.lua
local toggleterm = require("toggleterm")

toggleterm.setup({
    size = 15,                    -- height for horizontal split
    open_mapping = [[<leader>t]], -- leader+t to toggle
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = false,       -- allow mapping in insert mode
    persist_size = true,
    direction = "horizontal",     -- can be "horizontal", "vertical", "tab", "float"
    close_on_exit = true,
    shell = vim.o.shell,          -- default shell
})

-- Optional: create keymaps for multiple terminals
local map = vim.keymap.set
local opts = { desc = "Toggle Terminal" }

-- Toggle the main terminal
map("n", "<leader>t", "<cmd>ToggleTerm<CR>", opts)
-- Horizontal terminal
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", opts)
-- Vertical terminal
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)
-- Floating terminal
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
