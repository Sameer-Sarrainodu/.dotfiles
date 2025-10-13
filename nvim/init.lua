-- =====================================================
-- INIT.LUA
-- Minimal Bootstrap + Config Loader
-- =====================================================

-- Folder structure:
-- ~/.config/nvim/
-- ├── init.lua                # This bootstrap file
-- ├── lua/
-- │   ├── config/             # General Neovim configs
-- │   │   ├── settings.lua
-- │   │   ├── keymaps.lua
-- │   │   └── autocmds.lua
-- │   ├── plugins.lua         # Main plugin loader (Lazy.nvim)
-- │   └── plugins/            # Plugin-specific configs (modular)
-- │       ├── core/
-- │       │   ├── autopairs.lua
-- │       │   ├── telescope.lua
-- │       │   ├── lsp.lua
-- │       │   └── mason.lua
-- │       ├── productivity/
-- │       │   ├── nvim-tree.lua
-- │       │   ├── bufferline.lua
-- │       │   ├── lualine.lua
-- │       │   ├── treesitter.lua
-- │       │   ├── which-key.lua
-- │       │   ├── comment.lua
-- │       │   └── todo-comments.lua
-- │       └── developer/
-- │           ├── cmp.lua
-- │           ├── conform.lua
-- │           ├── lazydev.lua
-- │           ├── blink-extra.lua
-- │           ├── dap.lua
-- │           └── quickrun.lua
-- └── ftplugin/
--     ├── yaml.lua
--     ├── terraform.lua
--     └── bash.lua

-- =====================================================
-- 1️⃣ Bootstrap Lazy.nvim
-- =====================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- =====================================================
-- 2️⃣ Load general Neovim configs
-- =====================================================
require("config.settings") -- Core options
require("config.keymaps") -- Keymaps
require("config.autocmds")
require("plugins")
require("config.colorscheme")

-- =====================================================
-- 3️⃣ Plugin setup (to be added later in plugins.lua)
-- =====================================================
-- Example: later you can require("plugins") here to setup Lazy.nvim plugins
-- require("plugins")

-- =====================================================
-- End of init.lua
-- =====================================================
