-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Stäng buffer" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Spara fil" })
vim.keymap.set("n", "<leader>qq", ":q<CR>", { desc = "Stäng Neovim" })
