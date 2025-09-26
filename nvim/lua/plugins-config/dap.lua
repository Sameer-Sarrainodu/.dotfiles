
local dap = require("dap")

-- You can configure adapters, configurations here if needed
-- For now just leave it default

-- Optional: map a key to open DAP REPL
vim.keymap.set("n", "<leader>dr", function()
  dap.repl.open(nil, "botright")
end, { desc = "Open DAP REPL" })
