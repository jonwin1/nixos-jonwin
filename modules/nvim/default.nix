{
  imports = [
    ./opts.nix
    ./cmp.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.gruvbox = {
      enable = true;
      settings = {
        transparent_mode = true;
      };
    };
  };
}
