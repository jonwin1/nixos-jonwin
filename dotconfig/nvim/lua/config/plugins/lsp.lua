return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            {
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
            "saghen/blink.cmp",
        },

        opts = {
            servers = {
                clangd = {},
                cmake = {},
                hls = {},
                lua_ls = {},
                nixd = {},
                sqls = {},
                texlab = {},
                typos_lsp = {},
            }
        },

        config = function(_, opts)
            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- opts[server].capabilities, if you've defined it
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "Format file" })
            vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Go to next error" })
            vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Go to previous error" })
            vim.keymap.set("n", "<leader>n", "<cmd>lnext<CR>zz", { desc = "Go to next location" })
            vim.keymap.set("n", "<leader>p", "<cmd>lprev<CR>zz", { desc = "Go to previous location" })
        end,
    },
}
