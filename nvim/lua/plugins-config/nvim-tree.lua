-- lua/plugins-config/nvim-tree.lua
local tree = require("nvim-tree")
tree.setup({})

-- Map <leader>e AFTER the plugin is loaded
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("NvimTreeToggle")
end, { silent = true })
