{ config, lib, pkgs, user, ... }:

{
  imports = [];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    # packages = with pkgs; [];
  };

  programs.home-manager.enable = true;

  # xsession, cursor, gtk theme, font ...

  home.stateVersion = "23.11";
}
