{ self, inputs, ... }: {
  flake.nixosModules.MODULE = { config, ... }: {
    imports = [
      self.nixosModules.OTHERMODULE
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.MODULE
    ];

    # NixOS options
  };

  flake.homeModules.MODULE = { pkgs, ... }: {
    # Home Manager options
  };
}
