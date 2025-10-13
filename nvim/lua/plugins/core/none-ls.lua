
-- ~/.config/nvim/lua/plugins/core/none-ls.lua

local null_ls = require("null-ls")

-- Define sources (formatters, linters, etc.)
null_ls.setup({
    sources = {
        -- Python formatters
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- YAML formatter
        null_ls.builtins.formatting.yamlfmt,

        -- Lua formatter
        null_ls.builtins.formatting.stylua,
    },

    on_attach = function(client, bufnr)
        -- Only if the client supports formatting
        if client.supports_method("textDocument/formatting") then

            -- Manual format keybind
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, { buffer = bufnr, desc = "Format current buffer" })

            -- 🌟 Auto-format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
