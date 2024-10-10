{ lib, ... }:
{
    services = {
        batsignal = {
            enable = true;
            extraArgs = [];
        };
    };

    wayland.windowManager.hyprland = {
        settings = {
            input = {
                kb_layout = "se";
                kb_options = [ "caps:swapescape" ];
            };

            cursor = {
                default_monitor = "eDP-1";
            };

            monitor = [
                "eDP-1, 2560x1600@120, 0x0, 1"
                ", preferred, auto, 1"
            ];

            workspace = [
                "1, monitor:eDP-1, default:true"
            ];
        };
    };

    programs.waybar = {
        settings = {
            mainBar = {
                "cpu" = {
                    format = lib.mkForce " {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}{icon8}{icon9}{icon10}{icon11}{icon12}{icon13}{icon14}{icon15} ";
                };

                "temperature" = {
                    thermal-zone = lib.mkForce 0;
                };
            };
        };
    };
}
