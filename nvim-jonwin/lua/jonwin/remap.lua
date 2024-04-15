vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>', { desc = "which_key_ignore" })
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>', { desc = "which_key_ignore" })
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>', { desc = "which_key_ignore" })
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>', { desc = "which_key_ignore" })

vim.keymap.set("n", "<leader>n", vim.cmd.Ex, { desc = "[N]etrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection [J]" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection [K]" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "which_key_ignore" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "which_key_ignore" })
vim.keymap.set("n", "n", "nzzzv", { desc = "which_key_ignore" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "which_key_ignore" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "[P]aste without copy" })

--vim.keymap.set("n", "<leader>y", '"+y')
--vim.keymap.set("v", "<leader>y", '"+y')
--vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d', { desc = "[D]elete without copy" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "[D]elete without copy" })

vim.keymap.set("n", "Q", "<nop>", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end, { desc = "[F]ormat" })

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "which_key_ignore" })
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "which_key_ignore" })
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "which_key_ignore" })
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "which_key_ignore" })

vim.keymap.set("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "[R]e[P]lace" })
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
