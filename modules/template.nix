{ self, inputs, ... }: {
  flake.nixosModules.MODULE = { config, ... }: {
    imports = [
      self.nixosModules.OTHERMODULE
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.HOMEMODULE
    ];

    # NixOS options
  };

  flake.homeModules.HOMEMODULE = { pkgs, ... }: {
    imports = [
      self.homeModules.OTHERHOMEMODULE
    ];

    # Home Manager options
  };
}
