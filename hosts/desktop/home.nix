{ config, lib, pkgs, user, ... }:

{
  imports = [
    #../../hm-modules/hyperland.nix
  ];

  home = {
    # packages = with pkgs; [];
  };

  # xsession, cursor, gtk theme, font ...
}
