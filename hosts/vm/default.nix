{ config, pkgs, user, ... }:

{
  imports = 
    [(import ./hardware-configuration.nix)];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  environment = {
    systemPackages = with pkgs; [
    ];
  };

  services = {};
}
