{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        key = "<left>";
        action = "<cmd>echo \"Use h to move!!\"<CR>";
        options.desc = "which_key_ignore";
      }
      {
        key = "<right>";
        action = "<cmd>echo \"Use l to move!!\"<CR>";
        options.desc = "which_key_ignore";
      }
      {
        key = "<up>";
        action = "<cmd>echo \"Use k to move!!\"<CR>";
        options.desc = "which_key_ignore";
      }
      {
        key = "<down>";
        action = "<cmd>echo \"Use j to move!!\"<CR>";
        options.desc = "which_key_ignore";
      }
      {
        key = "[d";
        action = "<CMD>lua vim.diagnostic.goto_prev()<CR>";
        options.desc = "Go to previous [d]iagnostic message";
      }
      {
        key = "]d";
        action = "<CMD>lua vim.diagnostic.goto_next()<CR>";
        options.desc = "Go to next [d]iagnostic message";
      }
      {
        key = "<leader>e";
        action = "<CMD>lua vim.diagnostic.open_float()<CR>"; 
        options.desc = "Show diagnostic [e]rror messages";
      }
      {
        key = "<leader>q";
        action = "<CMD>lua vim.diagnostic.setloclist()<CR>";
        options.desc = "Open diagnostic [q]uickfix list";
      }
      {
        key = "<leader>n";
        action = "<CMD>Ex<CR>";
        options.desc = "[n]etrw";
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Move selection [J]";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options.desc = "Move selection [K]";
      }
      {
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "which_key_ignore";
      }
      {
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "which_key_ignore";
      }
      {
        key = "n";
        action = "nzzzv";
        options.desc = "which_key_ignore";
      }
      {
        key = "N";
        action = "Nzzzv";
        options.desc = "which_key_ignore";
      }
      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
        options.desc = "[p]aste without copy";
      }
      {
        key = "<leader>d";
        action = "\"_d";
        options.desc = "[d]elete without copy";
      }
      {
        mode = "v";
        key = "<leader>d";
        action = "\"_d";
        options.desc = "[d]elete without copy";
      }
      {
        key = "Q";
        action = "<nop>";
        options.desc = "which_key_ignore";
      }
      {
        key = "<leader>f"; 
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
        options.desc = "[f]ormat";
      }
      {
        key = "<leader>rp";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        options.desc = "[r]e[p]lace";
      }
    ];
  };
}
