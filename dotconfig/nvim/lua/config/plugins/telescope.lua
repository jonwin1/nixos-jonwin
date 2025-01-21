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
                defaults = require("telescope.themes").get_ivy {
                    layout_config = {
                        height = 0.6
                    }
                },
                extensions = {
                    fzf = {}
                }
            }

            require("telescope").load_extension("fzf")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<space>sf", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<space>sg", builtin.git_files, { desc = "Telescope git files" })
            vim.keymap.set("n", "<space>sr", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<space>sb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<space>sh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<space>sm", builtin.man_pages, { desc = "Telescope man pages" })
            vim.keymap.set("n", "<space>ss", builtin.spell_suggest, { desc = "Telescope spell suggest" })
        end
    }
}
