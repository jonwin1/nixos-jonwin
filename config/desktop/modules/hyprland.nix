{ user, ... }:
let
  primary = "AOC U34G2G4R3 0x0000326C";
  tv = "Samsung Electric Company QCQ90S 0x01000E00";
in
{
  home-manager.users.${user} = {
    wayland.windowManager.hyprland.settings = {
      cursor = {
        default_monitor = "DP-1";
      };

      monitor = [
        "desc:${primary}, 3440x1440@144, 0x0, 1"
        "desc:${tv}, 3840x2160@120, auto-left, 1"
      ];

      workspace = [
        "1, monitor:desc:${primary}, default:true"
        "10, monitor:desc:${tv}, default:true"
      ];
    };
  };

  jonwin.waybar.output = [ "DP-1" ];
}
