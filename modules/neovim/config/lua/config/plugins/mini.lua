return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.diff').setup()
        require('mini.git').setup({
            vim.keymap.set({ 'n', 'x' }, 'gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>')
        })
        require('mini.icons').setup()
        require('mini.statusline').setup()
    end
}
