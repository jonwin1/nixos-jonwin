{user, ...}: {
  home-manager.users.${user} = {
    wayland.windowManager.hyprland.settings = {
      cursor = {
        default_monitor = "eDP-1";
      };

      monitor = [
        "eDP-1, 2560x1600@120, 0x0, 1.25"
        "desc:ASUSTek COMPUTER INC ASUS VP247 HALMTF188756, preferred, 2048x0, 1"
        "desc:AOC 2460G5 0x00011131, preferred, 3968x0, 1"
      ];
    };
  };
}
