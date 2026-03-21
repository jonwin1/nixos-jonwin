{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./packages.nix

    # Local modules
    ./modules/hyprland.nix

    # Global modules
    ../../modules/boot-encrypted.nix
    ../../modules/foldingathome.nix
    ../../modules/zmkbatx.nix
  ];
}
