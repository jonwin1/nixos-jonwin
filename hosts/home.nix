{ config, lib, pkgs, user, host, ... }:
{
  imports = [
    ../hm-modules
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    file = {
      "backgrounds" = {
        source = ../backgrounds;
        recursive = true;
      };
    };
  };

  services = {
    random-background = {
      enable = true;
      display = "fill";
      imageDirectory = "%h/backgrounds";
      interval = "1h";
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
