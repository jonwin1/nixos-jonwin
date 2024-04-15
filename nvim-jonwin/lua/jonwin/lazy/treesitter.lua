return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "bash", "c", "cmake", "lua", "markdown", "vim", "vimdoc" },
        auto_install = true,
        highlight = {
            enable = true,
            disable = { "latex" },
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup(opts)
    end,
}
