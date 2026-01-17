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
    ../../modules/boot-encrypted.nix
    ../../modules/cross-code.nix
  ];
}
