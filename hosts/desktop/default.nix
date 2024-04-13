{ config, pkgs, user, ... }:

{
  imports = 
    [(import ./hardware-configuration.nix)];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 5;
    };
    timeout = 5;
  };

  environment = {
    systemPackages = with pkgs; [
    ];
  };

  services = {};
}
