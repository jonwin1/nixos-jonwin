return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "c", "cmake", "lua", "markdown", "vim", "vimdoc" },
            auto_install = true,
            ignore_install = { "latex" },
            indent = {
                enable = true
            },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    if lang == "latex" then
                        print("Treesitter disabled")
                        return true
                    end

                    local max_fliesize = 100 * 1024
                    local ok, stats = pcall(vim.lopp.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        vim.notify(
                        "File larger than 100KB treesitter disabled for performance",
                        vim.log.levels.WARN,
                        {title = "Treesitter"}
                        )
                        return true
                    end
                end,
            },
            indent = { enable = true },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    }
}
