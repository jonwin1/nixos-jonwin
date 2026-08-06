{ self, ... }: {
  flake.nixosModules.hyprlandProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      hypr
      waybar
      waybarHyprland
    ];

    services.displayManager = {
      defaultSession = "hyprland-uwsm";
    };
  };
}
