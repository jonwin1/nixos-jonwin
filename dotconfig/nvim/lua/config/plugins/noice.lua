return {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    require("noice").setup({
        messages = {
            view_search = false,
        },
        presets = {
            command_palette = true,
            lsp_doc_border = true,
        },
    })
}
