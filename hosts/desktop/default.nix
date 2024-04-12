{ config, pkgs, user, ... }:

{
  imports = 
    [(import ./hardware-configuration.nix)];

  environment = {
    systemPackages = with pkgs; [
    ];
  };

  services = {};
}
