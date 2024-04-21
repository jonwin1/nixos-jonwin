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
}
