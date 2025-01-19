-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center line on scroll/search
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete and paste without copy
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Search and replace word
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><left>]])

-- Indent while remaining in visual
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Switch between source and header file (C/C++)
vim.keymap.set("n", "<leader>ch", "<CMD>ClangdSwitchSourceHeader<CR>")

-- Avoid accidental macro use
vim.keymap.set("n", "Q", "<nop>")
