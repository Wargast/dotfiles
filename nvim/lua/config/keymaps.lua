-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "kj", "<esc>", { desc = "escape insert mode" })
vim.keymap.set("i", "<C-l>", "<esc>A", { desc = "go end of line" })
