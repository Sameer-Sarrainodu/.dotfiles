
-- lua/plugins-config/trouble.lua
local trouble = require("trouble")

-- Plugin options
trouble.setup({
    position = "bottom",
    height = 10,
    icons = {
        error = "",
        warning = "",
        hint = "",
        info = "",
        other = "",
    },
    fold_open = "",
    fold_closed = "",
    action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
        toggle_fold = { "zR", "zM" },
        previous = "k",
        next = "j",
    },
    auto_open = false,
    auto_close = true,
    use_diagnostic_signs = true,
})

-- Keymaps
local map = vim.keymap.set
local opts = { silent = true }

-- Trouble keymaps
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)
map("n", "<leader>cr", "<cmd>Trouble lsp_references toggle<cr>", opts)
map("n", "<leader>ci", "<cmd>Trouble lsp_implementations toggle<cr>", opts)
map("n", "<leader>cd", "<cmd>Trouble lsp_definitions toggle<cr>", opts)
map("n", "<leader>ct", "<cmd>Trouble lsp_type_definitions toggle<cr>", opts)

-- Navigate Trouble items
map("n", "<leader>tn", function() require("trouble.api").next({ jump = true }) end, opts)
map("n", "<leader>tp", function() require("trouble.api").prev({ jump = true }) end, opts)

-- Telescope diagnostics keymaps
map("n", "<leader>ft", function() require("telescope.builtin").diagnostics() end, opts)
map("n", "<leader>fT", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, opts)
