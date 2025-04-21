{ ... }:
{
    wayland.windowManager.hyprland = {
        settings = {
            cursor = {
                default_monitor = "DP-1";
            };

            monitor = [
                "DP-1, 3440x1440@144, 0x0, 1"
                "HDMI-A-1, 3840x2160@120, auto-left, 1, bitdepth, 10, cm, hdr, sdrbrightness, 1.2, vrr, 1"
            ];

            workspace = [
                "1, monitor:DP-1, default:true"
                "2, monitor:DP-1"
                "3, monitor:DP-1"
                "4, monitor:DP-1"
                "5, monitor:DP-1"
                "6, monitor:HDMI-A-1, default:true"
                "7, monitor:HDMI-A-1"
                "8, monitor:HDMI-A-1"
                "9, monitor:HDMI-A-1"
                "10, monitor:HDMI-A-1"
            ];
        };
    };
    programs.waybar = {
        settings = {
            mainBar = {
                "hyprland/workspaces" = {
                    persistent-workspaces = {
                        "DP-1" = [ 1 2 3 4 5 ];
                        "HDMI-A-1" = [ 6 7 8 9 10 ];
                    };
                };
            };
        };
    };
}
