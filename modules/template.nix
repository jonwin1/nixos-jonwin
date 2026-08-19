{ self, ... }: {
  flake = {
    nixosModules.MODULE = { config, pkgs, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.MODULE
      ];

      # environment.systemPackages = [
      #   self.packages.${pkgs.stdenv.hostPlatform.system}.PACKAGE
      # ];

      # NixOS options
    };

    homeModules.MODULE = { pkgs, ... }: {
      # Home Manager options
    };

    wrappers.PACKAGE = { wlib, ... }: {
      # imports = [ wlib.wrapperModules.PACKAGE ];
      # OR
      # imports = [ wlib.modules.default ];
      # package = pkgs.PACKAGE;
    };
  };
}
