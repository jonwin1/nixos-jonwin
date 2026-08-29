{ self, ... }: {
  flake.nixosModules.waybarMango = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.waybarMango
    ];
  };

  flake.homeModules.waybarMango = {
    programs.waybar.settings = {
      main = {
        modules-left = [
          "mango/workspaces"
          "mango/layout"
          "mango/keymode"
          "mango/window"
        ];

        "mango/workspaces" = {
        };
      };
    };
  };
}
