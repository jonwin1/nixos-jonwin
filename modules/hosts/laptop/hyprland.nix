{ self, ... }: {
  flake.nixosModules.laptopHyprland = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.laptopHyprland
    ];
  };

  flake.homeModules.laptopHyprland = {
    wayland.windowManager.hyprland.settings = {
      cursor = {
        default_monitor = "eDP-1";
      };

      monitor = [
        "eDP-1, 2560x1600@60, 0x0, 1.6"
        "desc:ASUSTek COMPUTER INC ASUS VP247 HALMTF188756, 1920x1080@75, 2560x0, 1"
        "desc:AOC 2460G5 0x00011131, 1920x1080@75, 4480x0, 1"
      ];
    };
  };
}
