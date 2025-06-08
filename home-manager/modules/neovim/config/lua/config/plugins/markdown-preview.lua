return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        require("lazy").load { plugins = { "markdown-preview.nvim" } }
        vim.fn["mkdp#util#install"]()
    end,

    vim.keymap.set("n", "<leader>cp", vim.cmd.MarkdownPreviewToggle, { desc = "Preview Markdown" })
}
