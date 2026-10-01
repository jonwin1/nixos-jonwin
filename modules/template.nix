{ self, ... }: {
  flake = {
    nixosModules.MODULE = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.MODULE
      ];

      # NixOS options
    };

    homeModules.MODULE = { my, ... }: {
      # Home Manager options
    };
  };
}
