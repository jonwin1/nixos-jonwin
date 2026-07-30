{ self, ... }: {
  flake.nixosModules.MODULE = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.MODULE
    ];

    # NixOS options
  };

  flake.homeModules.MODULE = { pkgs, ... }: {
    # Home Manager options
  };
}
