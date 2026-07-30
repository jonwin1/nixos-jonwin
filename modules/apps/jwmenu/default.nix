{ self, inputs, ... }: {
  flake.nixosModules.jwmenu = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.jwmenu
    ];
  };

  flake.homeModules.jwmenu = { pkgs, ... }: {
    home = {
      packages = with pkgs; [
        inputs.jwmenu.packages.${stdenv.hostPlatform.system}.default
      ];

      file = {
        ".config/jwmenu" = {
          source = ./menus;
          recursive = true;
        };
      };
    };
  };
}
