{ ... }:
{
    services = {
        batsignal = {
            enable = true;
            extraArgs = [];
        };
    };

    wayland.windowManager.hyprland = {
        settings = {
            cursor = {
                default_monitor = "eDP-1";
            };

            workspace = [
                "1, monitor:eDP-1, default:true"
                "2, monitor:eDP-1"
                "3, monitor:eDP-1"
                "4, monitor:eDP-1"
                "5, monitor:eDP-1"
            ];
        };
    };
}
