{ config, user, ... }:

{
  imports = [
    (import ./hardware-configuration.nix)
    ../../modules/foldingathome.nix
    ../../modules/kmonad.nix
  ];

  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "${user}";
    };
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      open = true;

      powerManagement = {
        enable = true;
      };
    };
  };
}
