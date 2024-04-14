{
  imports = [
    ./opts.nix
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
