{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./packages.nix

    # Local modules
    ./modules/hyprland.nix
    ./modules/nvidia.nix
    ./modules/powerManagement.nix

    # Global modules
    ../../modules/cross-code.nix
  ];
}
