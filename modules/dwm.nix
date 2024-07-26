{ pkgs, inputs, ... }:
{
    services = {
        xserver = {
            enable = true;
            windowManager.dwm = {
                enable = true;
                package = inputs.dwm.packages."x86_64-linux".default;
            };
            xkb = {
                layout = "se";
                variant = "";
            };
        };
    };

    systemd.user.services = {
        set-display = {
            script = ''
                ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --off
                ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 3440x1440 --rate 144
            '';
            wantedBy = [ "graphical-session.target" ];
            partOf = [ "graphical-session.target" ];
        };
    };


    environment = {
        variables = {
            TERMINAL = "st";
        };
        systemPackages = [
            pkgs.xorg.libXext
            inputs.dmenu.packages."x86_64-linux".default
            inputs.st.packages."x86_64-linux".default
            inputs.slstatus.packages."x86_64-linux".default
        ];
    };

    systemd.user.services.slstatus = {
        description = "slstatus";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
            ExecStart = "/run/current-system/sw/bin/slstatus";
            RestartSec = 3;
            Restart = "always";
        };
    };
}

