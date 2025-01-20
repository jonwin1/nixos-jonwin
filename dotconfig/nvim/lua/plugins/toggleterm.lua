return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup{

            -- Keybind to toggle last open terminal
            open_mapping = [[<C-t>]],

            -- Float default terminal
            direction = "float",
            float_opts = {
                border = "curved",
            },

            -- Set size depending on type
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
        }

        local Terminal = require("toggleterm.terminal").Terminal

        -- Create terminals
        local lazygit = Terminal:new({ cmd = "lazygit", dir ="git_dir", direction = "float" })
        local floating = Terminal:new({ direction = "float" })
        local horizontal = Terminal:new({ direction = "horizontal" })
        local vertical = Terminal:new({ direction = "vertical" })

        -- Define toggle funcitons
        function _floating_toggle()
            floating:toggle()
        end
        function _lazygit_toggle()
            lazygit:toggle()
        end
        function _horizontal_toggle()
            horizontal:toggle()
        end
        function _vertical_toggle()
            vertical:toggle()
        end

        -- Set keymaps
        vim.keymap.set("n", "<leader>tf", "<cmd>lua _floating_toggle()<CR>")
        vim.keymap.set("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>")
        vim.keymap.set("n", "<leader>th", "<cmd>lua _horizontal_toggle()<CR>")
        vim.keymap.set("n", "<leader>tv", "<cmd>lua _vertical_toggle()<CR>")

        -- Easier navigation in and out of terminals
        vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]])
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
    end,
}
