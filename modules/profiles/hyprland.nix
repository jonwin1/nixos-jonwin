{ self, ... }: {
  flake.nixosModules.hyprlandProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      dunst
      hypr
      jwmenu
      rofi
      stylix
      swayosd
      waybar
      waybarHyprland
    ];

    services.displayManager = {
      defaultSession = "hyprland-uwsm";
    };
  };
}
