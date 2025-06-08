return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            delete_to_trash = true,
            win_options = {
                signcolumn = "yes:2",
            },
        },
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        lazy = false,
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {}
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = { "stevearc/oil.nvim" },
        config = true,
    },
}
