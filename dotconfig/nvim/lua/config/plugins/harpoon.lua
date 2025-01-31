return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon Add" })

        vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
        vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
        vim.keymap.set("n", "<leader>l", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
        vim.keymap.set("n", "<leader>ö", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
        vim.keymap.set("n", "<leader>m", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })
        vim.keymap.set("n", "<leader>,", function() harpoon:list():select(6) end, { desc = "Harpoon file 6" })
        vim.keymap.set("n", "<leader>.", function() harpoon:list():select(7) end, { desc = "Harpoon file 7" })
        vim.keymap.set("n", "<leader>-", function() harpoon:list():select(8) end, { desc = "Harpoon file 8" })
    end
}
