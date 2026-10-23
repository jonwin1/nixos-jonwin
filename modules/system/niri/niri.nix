{ self, ... }: {
  flake = {
    nixosModules.niri = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.niri
      ];

      environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];
    };

    homeModules.niri = { pkgs, ... }: {
      wayland.windowManager.niri = {
        enable = true;
        systemd.enable = true;
        portalPackage = pkgs.xdg-desktop-portal-gtk;
      };
    };
  };
}
