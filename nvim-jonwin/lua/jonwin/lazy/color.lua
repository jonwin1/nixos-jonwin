return {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
        vim.o.termguicolors = true
        vim.o.background = 'dark'

        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_better_performance = 1

        vim.g.gruvbox_material_transparent_background = 1

        vim.cmd.colorscheme("gruvbox-material")
        vim.cmd.hi("Comment gui=none")
    end,
}
