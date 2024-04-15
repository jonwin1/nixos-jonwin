return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({})

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end,
            { desc = "Harpoon [A]ppend" })
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "[H]arpoon toggle menu" })

        vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end,
            { desc = "Harpoon select 1" })
        vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end,
            { desc = "Harpoon select 2" })
        vim.keymap.set("n", "<leader>l", function() harpoon:list():select(3) end,
            { desc = "Harpoon select 3" })
        vim.keymap.set("n", "<leader>ö", function() harpoon:list():select(4) end,
            { desc = "Harpoon select 4" })
    end
}
