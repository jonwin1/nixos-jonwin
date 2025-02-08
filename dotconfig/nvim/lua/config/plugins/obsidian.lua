return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",


    },
    opts = {
        workspaces = {
            {
                name = "Obsidian Vault",
                path = "~/Documents/Obsidian Vault",
            },
        },
        notes_subdir = "Zettelkasten",
        daily_notes = {
            folder = "Daily Notes",
            template = "Daily Note Template",
        },
        templates = {
            folder = "Templates",
        },

        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },

        -- Open URL in the default web browser.
        ---@param url string
        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
        end,

        -- Open image in the default
        ---@param img string
        follow_img_func = function(img)
            vim.fn.jobstart({ "xdg-open", img })
        end,

        attachments = {
            img_folder = "Files",
        },
    },
}
