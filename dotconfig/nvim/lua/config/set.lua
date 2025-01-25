-- Show line number and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs to be 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

--
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.g.have_nerd_font = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Show search and replace matches while typing
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- Ignore case for match unless explicitly using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Automatically break lines for .tex and .md files
vim.opt.linebreak = true
vim.cmd([[autocmd FileType tex set textwidth=80]])
vim.cmd([[autocmd FileType md set textwidth=80]])

-- Disable mouse
vim.opt.mouse = ""

-- Share clipboard with system
vim.opt.clipboard = "unnamedplus"

-- Configure history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Show tabs, trailing spaces, and non-breakable spaces
-- Also indicate when line continues outside window
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", precedes = "«", extends = "»" }

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
