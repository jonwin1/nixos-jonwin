{ self, ... }: {
  flake.nixosModules.waybar = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.waybar
    ];

    services.udisks2.enable = true;
  };

  flake.homeModules.waybar = { pkgs, ... }: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    services = {
      udiskie.enable = true;
    };

    home = {
      file = {
        ".config/waybar/scripts" = {
          source = ./scripts;
          recursive = true;
        };
      };

      packages = with pkgs; [
        lm_sensors
      ];
    };
  };
}
