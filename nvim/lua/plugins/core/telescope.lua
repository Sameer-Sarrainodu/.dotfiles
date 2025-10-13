-- ~/.config/nvim/lua/plugins/core/telescope.lua

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- =====================================================
-- Telescope setup
-- =====================================================
telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { preview_width = 0.6 },
            vertical = { preview_height = 0.5 },
        },
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        file_ignore_patterns = { "node_modules", "%.git/", "dist", "build" },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
                ["q"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
        },
    },
    pickers = {
        find_files = { theme = "dropdown", hidden = true },
        live_grep = { layout_strategy = "horizontal" },
        buffers = { theme = "dropdown", sort_mru = true },
        help_tags = { theme = "dropdown" },
        oldfiles = { theme = "dropdown" },
        current_buffer_fuzzy_find = { theme = "dropdown" },
        grep_string = { layout_strategy = "horizontal" },
        -- Uncomment the following lines when LSP is setup
        -- lsp_definitions = {},
        -- lsp_references = {},
        -- lsp_implementations = {},
        -- lsp_type_definitions = {},
        -- diagnostics = {},
        -- quickfix = {},
        -- loclist = {},
    },
    extensions = {
        -- Optional: add fzf-native or media-files extensions here
    },
})

-- Optional: load extensions
-- telescope.load_extension("fzf")

-- =====================================================
-- Telescope keymaps
-- =====================================================
local map = vim.keymap.set

-- File/project pickers
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Grep in project" })
map("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
map("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" })
map("n", "<leader>fs", builtin.grep_string, { desc = "Search word under cursor" })

-- Uncomment these after LSP setup
-- map("n", "<leader>ld", builtin.lsp_definitions, { desc = "Go to definition" })
-- map("n", "<leader>lr", builtin.lsp_references, { desc = "Find references" })
-- map("n", "<leader>li", builtin.lsp_implementations, { desc = "Go to implementation" })
-- map("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Type definitions" })
-- map("n", "<leader>le", function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "Buffer diagnostics" })
-- map("n", "<leader>lE", builtin.diagnostics, { desc = "Workspace diagnostics" })
-- map("n", "<leader>lq", builtin.quickfix, { desc = "Quickfix list" })
-- map("n", "<leader>ll", builtin.loclist, { desc = "Location list" })
