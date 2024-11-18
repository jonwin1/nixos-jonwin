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

            master = {
                mfact = lib.mkForce 0.5;
                orientation = lib.mkForce "left";
                always_center_master = lib.mkForce false;
            };
        };
    };

    programs = {
        kitty.font.size = lib.mkForce 13;
        qutebrowser.settings.zoom.default = lib.mkForce 125;
    };
}
