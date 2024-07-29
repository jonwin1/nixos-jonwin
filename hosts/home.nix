{ user, pkgs, ... }:
{
    imports = [
        ../hm-modules
    ];

    home = {
        username = "${user}";
        homeDirectory = "/home/${user}";
        file = {
            "Pictures/wallpaper.png" = {
                source = ../wallpaper.png;
                recursive = true;
            };
            ".config/bwm" = {
                source = ../dotconfig/bwm;
                recursive = true;
            };
        };
        pointerCursor = {
            gtk.enable = true;
            package = pkgs.rose-pine-cursor;
            name = "BreezeX-RosePine-Linux";
            size = 24;
        };
        packages = with pkgs; [
            (writeShellScriptBin "rofi-power-menu" ''
                option="Cancel\nShutdown\nRestart\nSleep\nLock"
                selected=$(echo -e $option | rofi -dmenu -i)
                if [ "$selected" = "Shutdown" ]; then
                    poweroff
                elif [ "$selected" = "Restart" ]; then
                    reboot
                elif [ "$selected" = "Sleep" ]; then
                    systemctl suspend
                elif [ "$selected" = "Lock" ]; then
                    #hyprlock?
                    return
                elif [ "$selected" = "Calcel" ]; then
                    return
                fi
            '')
        ];
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.nordic;
            name = "Nordic";
        };

        iconTheme = {
            package = pkgs.nordzy-icon-theme;
            name = "Nordzy";
        };

        font = {
            name = "FiraCodeNerdFont";
            size = 12;
        };
    };

    services = {
        udiskie.enable = true;
    };

    programs = {
        home-manager.enable = true;
    };

    home.stateVersion = "23.11";
}
