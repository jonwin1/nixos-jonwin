return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },

    vim.keymap.set("n", "<leader>cp", vim.cmd.MarkdownPreviewToggle, { desc = "Preview Markdown" })
}
