{ self, ... }: {
  flake = {
    nixosModules.niri = { config, pkgs, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.niri
      ];

      environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];

      # TODO: Move to profile
      services.displayManager = {
        sessionPackages = [ pkgs.niri ];
      };
    };

    homeModules.niri = {
      wayland.windowManager.niri = {
        enable = true;
        systemd.enable = true;
        settings = { };
      };
    };
  };
}
