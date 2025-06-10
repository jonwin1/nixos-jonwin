return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },

        config = function()
            require("telescope").setup {
                pickers = {
                    man_pages = {
                        sections = { "ALL" },
                    },
                },
                extensions = {
                    fzf = {}
                }
            }

            require("telescope").load_extension("fzf")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "Telescope git files" })
            vim.keymap.set("n", "<leader>sr", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Telescope man pages" })
            vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, { desc = "Telescope spell suggest" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope keymaps" })
        end
    }
}
