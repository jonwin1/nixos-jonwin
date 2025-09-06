{user, ...}: {
  home-manager.users.${user} = {
    wayland.windowManager.hyprland.settings = {
      cursor = {
        default_monitor = "DP-1";
      };

      monitor = [
        "desc:AOC U34G2G4R3 0x0000326C, 3440x1440@144, 0x0, 1"
        "desc:Samsung Electric Company QCQ90S 0x01000E00, 3840x2160@120, auto-left, 1"
      ];
    };
  };
}
