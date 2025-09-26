
-- lua/plugins.lua

local plugins = {
    -- autopairs
    {
        "windwp/nvim-autopairs",
        lazy = false,
        config = function()
            require("plugins-config.autopairs")
        end,
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins-config.telescope")
        end,
    },

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins-config.bufferline")  -- call the separate config
        end,
    },

    -- nvim tree
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Load the plugin only when these commands are called
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("plugins-config.nvim-tree")  -- call the separate config
        end,
    },

    -- toggle term
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        lazy = false,
        config = function()
            require("plugins-config.toggleterm")  -- call the separate config
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins-config.lualine")  -- call the separate config
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("plugins-config.treesitter")
        end,
    },

    -- which key
    {
        "folke/which-key.nvim",
        lazy = false,
        config = function()
            require("plugins-config.which-key")  -- call the separate config
        end,
    },

    -- trouble
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
        config = function()
            require("plugins-config.trouble")  -- call the separate config
        end,
    },

    -- comment
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("plugins-config.comment")  -- call the separate config
        end,
    },

    -- todo
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        event = "BufReadPost",  -- load after opening a file
        config = function()
            require("plugins-config.todo-comments")  -- call the separate config
        end,
    },

    -- mason
    {
        "williamboman/mason.nvim",
        lazy = false,  -- always loaded
        config = function()
            require("plugins-config.mason")  -- call the separate config
        end,
    },


    -- blink
    {
        "saghen/blink.cmp",
        version ="1.*",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
        config = function()
            require("plugins-config.cmp")()
        end,
    },

    -- conform
    {
        "stevearc/conform.nvim",
        lazy = false,
        config = function()
            require("plugins-config.conform")()
        end,
    },
    -- LazyDev (Lua enhancements)
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = function()
            require("plugins-config.lazydev")
        end,
    },

    -- Blink extra config (with LazyDev integration)
    {
        "saghen/blink.cmp",
        config = function()
            require("plugins-config.blink-extra")
        end,
    },

    -- colorscheme
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            require("plugins-config.colorscheme")
        end,
    },

    -- quickrun
    {
        "thinca/vim-quickrun",
        lazy = false,
        cmd = "QuickRun",  -- lazy-load on command
        keys = {
{ "<leader>rr", "<cmd>QuickRun<cr>", desc = "Quick Run Current File" },
        },
        config = function()
            require("plugins-config.quickrun")
        end,
    },

    -- DAP (debugging)
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        config = function()
          require("plugins-config.dap")
        end
    },

    


    


    

}

-- Setup Lazy.nvim with all plugins

require("lazy").setup(plugins, {
    install = {
        missing = true,
        colorscheme = { "habamax" }
    },
    checker = { enabled = true, notify = false },
    change_detection = { enabled = true, notify = false },
    performance = {
        rtp = {
            disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" }
        }
    }
})
