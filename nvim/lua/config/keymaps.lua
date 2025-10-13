
-- Make sure leader is set first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("i", "jj", "<ESC>", { silent = true })
map("n", "<leader>w", ":w<CR>", { silent = true })  -- save
map("n", "<leader>q", ":q<CR>", { silent = true })  -- quit
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { silent = true }) -- reload config

-- Window navigation
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

vim.keymap.set("n", "<leader>q", ":copen<CR>")  -- open quickfix at bottom
vim.keymap.set("n", "<leader>l", ":lopen<CR>")  -- open location list



