{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;

    hlsearch = false;
    incsearch = true;
    inccommand = "split";
    termguicolors = true;

    wrap = false;
    colorcolumn = "80";
    signcolumn = "yes";
    cursorline = true;
    scrolloff = 10;

    ignorecase = true;
    smartcase = true;

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;
    breakindent = true;

    mouse = "";
    clipboard = "unnamedplus";

    swapfile = false;
    backup = false;
    #undodir = os.getenv("HOME") .. "/.vim/undodir";
    undofile = true;

    updatetime = 250;
    timeoutlen = 300;
  };
}
