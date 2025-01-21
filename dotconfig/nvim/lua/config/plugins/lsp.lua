return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            require("lspconfig").clangd.setup {}
            require("lspconfig").cmake.setup {}
            require("lspconfig").hls.setup {}
            require("lspconfig").lua_ls.setup {}
            require("lspconfig").nixd.setup {}
            require("lspconfig").sqls.setup {}
            require("lspconfig").texlab.setup {}
            require("lspconfig").typos_lsp.setup {}

            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "Format file" })
            vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Go to next error" })
            vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Go to previous error" })
            vim.keymap.set("n", "<leader>n", "<cmd>lnext<CR>zz", { desc = "Go to next location" })
            vim.keymap.set("n", "<leader>p", "<cmd>lprev<CR>zz", { desc = "Go to previous location" })
        end,
    },
}
