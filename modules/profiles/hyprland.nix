{ self, ... }: {
  flake.nixosModules.hyprlandProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      hypr
      waybar
    ];

    services.displayManager = {
      defaultSession = "hyprland-uwsm";
    };
  };
}
