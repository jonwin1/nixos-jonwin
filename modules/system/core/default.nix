{ self, ... }: {
  flake.nixosModules.core = {
    imports = [
      self.nixosModules.boot
      self.nixosModules.locale
      self.nixosModules.network
      self.nixosModules.user
    ];

    # nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    system.stateVersion = "26.05";
  };
}
