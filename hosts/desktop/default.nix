{ config, user, ... }:

{
  imports = [
    (import ./hardware-configuration.nix)
    ../../modules/foldingathome.nix
    ../../modules/kmonad.nix
  ];

  boot = {
    kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  };

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
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
