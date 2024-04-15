{
  imports = [
    ./cmp.nix
    ./harpoon.nix
    ./lsp.nix
    ./opts.nix
    ./remap.nix
    ./telescope.nix
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
