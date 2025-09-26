-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


require("settings")
require("keymaps")
require("plugins")
require("lsp")
require("autocmds")

-- Load bottom panel (after all plugins are loaded)

--[[
~/.dotfiles/nvim/
├── init.lua              # Bootstrap (loads settings, keymaps, plugins, theme)
├── lua/
│   ├── settings.lua      # Core Neovim options
│   ├── keymaps.lua       # Custom key mappings
│   ├── plugins.lua       # Plugin manager (lazy.nvim)
│   ├── lsp.lua           # LSP + completion setup
│   ├── theme.lua         # Colorscheme setup
│   └── plugins-config/   # Modular plugin configs
│       ├── nvim-tree.lua
│       ├── telescope.lua
│       ├── lualine.lua
│       ├── treesitter.lua
│       ├── cmp.lua
│       └── autopairs.lua
└── ftplugin/             # Filetype-specific configs (YAML, Terraform, etc.)
    ├── yaml.lua
    ├── terraform.lua
    └── bash.lua

]]


