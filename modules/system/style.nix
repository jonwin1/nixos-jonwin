{ self, ... }: {
  flake.nixosModules.style =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      options.my.font = {
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.nerd-fonts.fira-code;
        };
        name = lib.mkOption {
          type = lib.types.str;
          default = "FiraCode Nerd Font";
        };
      };

      config = {
        home-manager.users.${config.my.username}.imports = [
          self.homeModules.style
        ];
      };
    };

  flake.homeModules.style = { pkgs, my, ... }: {
    home.pointerCursor = {
      enable = true;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    gtk = {
      enable = true;

      theme = {
        name = "adw-gtk3"; # Themed by noctalia
        package = pkgs.adw-gtk3;
      };

      font = {
        package = my.font.package;
        name = my.font.name;
      };

      iconTheme = {
        package = pkgs.nordzy-icon-theme;
        name = "Nordzy-dark";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk3";
    };
  };
}
