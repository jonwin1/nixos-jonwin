{ pkgs, stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
    ../../nixos/modules/foldingathome.nix
    ../../nixos/modules/kmonad.nix
  ];

  services = {
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

  environment.systemPackages = with pkgs; [home-manager];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = stateVersion;
}
