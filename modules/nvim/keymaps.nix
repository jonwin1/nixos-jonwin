{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "<Esc>";
      mode = "n";
      action = "<cmd>nohlsearch<CR>";
      desc = "Clear search highlight";
    }
    {
      key = "J";
      mode = "v";
      action = ":m '>+1<CR>gv=gv";
      desc = "Move selection down";
    }
    {
      key = "K";
      mode = "v";
      action = ":m '<-2<CR>gv=gv";
      desc = "Move selection down";
    }
    {
      key = "n";
      mode = "n";
      action = "nzzzv";
      desc = "Center line on search next";
    }
    {
      key = "N";
      mode = "n";
      action = "Nzzzv";
      desc = "Center line on search previous";
    }
    {
      key = "<leader>p";
      mode = "x";
      action = "\"_dP";
      desc = "Paste without copying to clipboard";
    }
    {
      key = "<leader>d";
      mode = ["n" "v"];
      action = "\"_d";
      desc = "Delete without saving to clipboard";
    }
    {
      key = "<";
      mode = "v";
      action = "<gv";
      desc = "Indent while keeping selection";
    }
    {
      key = ">";
      mode = "v";
      action = ">gv";
      desc = "Indent while keeping selection";
    }
    {
      key = "-";
      mode = "n";
      action = "<CMD>Oil<CR>";
      desc = "Open parent directory [Oil]";
    }
    {
      key = "<leader>u";
      mode = "n";
      action = "<CMD>UndotreeToggle<CR>";
      desc = "Toggle Undotree";
    }
  ];
}
