{ config, lib, pkgs, user, ... }:

{
  imports = [
  ];

  home = {
  };

  services = {
    batsignal = {
      enable = true;
      extraArgs = [];
    };
  };
  programs = {
    qutebrowser = {
      settings = {
        zoom.default = "125%";
      };
    };
  };
}
