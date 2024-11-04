{ ... }:
{
    wayland.windowManager.hyprland = {
        settings = {
            cursor = {
                default_monitor = "DP-3";
            };

            monitor = [
                "DP-3, 3440x1440@144, 1920x0, 1"
                "HDMI-A-1, 1920x1080@120, 0x0, 1"
                ", preferred, auto, 1"
            ];

            workspace = [
                "1, monitor:DP-3, default:true"
                "2, monitor:DP-3"
                "3, monitor:DP-3"
                "4, monitor:DP-3"
                "5, monitor:DP-3"
                "6, monitor:HDMI-A-1, default:true"
                "7, monitor:HDMI-A-1"
                "8, monitor:HDMI-A-1"
                "9, monitor:HDMI-A-1"
                "10, monitor:HDMI-A-1"
            ];
        };
    };
}
