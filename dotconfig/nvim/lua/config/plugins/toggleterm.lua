return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup {
            open_mapping = [[<C-t>]],
            direction = "float",
            float_opts = {
                border = "curved",
            },
        }

        local Terminal = require("toggleterm.terminal").Terminal
        local horizontal = Terminal:new({ direction = "horizontal" })
        function _Horizontal_toggle()
            horizontal:toggle()
        end

        vim.keymap.set("n", "<leader>t", "<cmd>lua _Horizontal_toggle()<CR>",
            { desc = "Terminal horizontal toggle" })

        -- Easier navigation in and out of terminals
        -- vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]])
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
    end,
}
