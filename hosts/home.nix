{ config, lib, pkgs, user, ... }:

{
  imports = [
    ../home-manager
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    # packages = with pkgs; [];
  };

  programs = {
    home-manager.enable = true;
    neovim = {
      enable = true;
      extraConfig = ''
        :luafile ~/.config/nvim/init.lua
      '';
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withPython3 = true;
    };
  };

  xdg.configFile.nvim = {
    source = ../nvim-jonwin;
    recursive = true;
  };

  # xsession, cursor, gtk theme, font ...

  home.stateVersion = "23.11";
}
