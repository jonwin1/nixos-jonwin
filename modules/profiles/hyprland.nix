{ self, ... }: {
  flake.nixosModules.hyprlandProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      rofi
      hypr
      jwmenu
      dunst
      swayosd
      waybar
      waybarHyprland
    ];

    services.displayManager = {
      defaultSession = "hyprland-uwsm";
    };
  };
}
