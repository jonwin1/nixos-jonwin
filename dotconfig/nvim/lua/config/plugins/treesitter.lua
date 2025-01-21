return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "c", "cmake", "lua", "markdown", "vim", "vimdoc" },
            auto_install = true,
            -- ignore_install = { "latex" },
            indent = { enable = true },
            highlight = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    }
}
