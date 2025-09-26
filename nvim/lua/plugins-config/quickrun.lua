-- Enforce window placement settings
vim.o.splitbelow = true
vim.o.splitright = false

-- Base configuration
vim.g.quickrun_config = {
  ["_"] = {
    outputter = "quickfix",
    runner = "system",
    hooks = {
      -- Clear quickfix list before running
      {
        name = "hook_clear_quickfix",
        kind = "hook",
        on_ready = function()
          vim.fn.setqflist({})
        end,
      },
      -- Open quickfix at the bottom after the run is complete
      {
        name = "hook_open_qf",
        kind = "hook",
        on_finish = function()
          -- Close any existing vertical splits to prevent side buffers
          vim.cmd("wincmd o") -- Close all other windows except current
          vim.cmd("botright copen 10") -- Open quickfix at bottom with height 10
          vim.cmd("wincmd J") -- Explicitly move to bottom (redundant but safe)
        end,
      },
    },
  },
}

-- Custom commands per filetype
vim.g.quickrun_config.python = { command = "python3", exec = "%" }
vim.g.quickrun_config.lua = { command = "lua", exec = "%" }
vim.g.quickrun_config.c = { command = "gcc", exec = "% && ./a.out" }
vim.g.quickrun_config.cpp = { command = "g++", exec = "% && ./a.out" }
vim.g.quickrun_config.bash = { command = "bash", exec = "%" }

-- Keymap for visual run
vim.keymap.set("v", "<leader>rr", ":QuickRun<CR>", { desc = "QuickRun Visual Selection" })
