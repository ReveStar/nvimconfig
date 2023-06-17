-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>tt", ":FloatermNew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tk", ":FloatermKill<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", ":FloatermHide", { noremap = true, silent = true })
