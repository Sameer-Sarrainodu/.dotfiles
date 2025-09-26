return function()
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            go  = { "goimports", "golines", "gofmt" },
            python = {"black", "isort"},
        },
        -- Optional: enable format on save
        -- format_on_save = {
        --     lsp_fallback = true,
        --     async = false,
        -- },
    })
end

