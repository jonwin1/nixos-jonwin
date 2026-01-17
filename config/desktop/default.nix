{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./packages.nix

    # Local modules
    ./modules/hyprland.nix

    # Global modules
    ../../modules/boot.nix
    ../../modules/foldingathome.nix
    ../../modules/zmkBATx.nix
  ];
}
