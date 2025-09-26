
-- lua/plugins-config/bufferline.lua
require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "Explorer" } },
    },
})
