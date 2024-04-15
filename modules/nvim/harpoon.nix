{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<leader>h";
      navFile = {
        "1" = "<leader>j";
        "2" = "<leader>k";
        "3" = "<leader>l";
        "4" = "<leader>ö";
      };
    };
  };
}
