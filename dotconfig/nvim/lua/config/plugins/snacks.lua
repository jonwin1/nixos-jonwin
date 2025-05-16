return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        bigfile = {},

        dashboard = {
            sections = {
                { section = "header" },
                { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
            },
        },

        indent = {
            animate = { enabled = false },
        },

        lazygit = {
            vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end,
                { desc = "LazyGit" })
        },
    },
}
