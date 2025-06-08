{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules
    ../modules/foldingathome.nix
    ../modules/kmonad.nix
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
  system.stateVersion = "23.11";
}
