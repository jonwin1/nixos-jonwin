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
        };
        pointerCursor = {
            gtk.enable = true;
            package = pkgs.rose-pine-cursor;
            name = "BreezeX-RosePine-Linux";
            size = 24;
        };
        packages = with pkgs; [
            (writeShellScriptBin "rofi-power-menu" ''
                option="Cancel\nShutdown\nReboot\nSleep\nLock"
                selected=$(echo -e $option | rofi -dmenu -i)
                if [ "$selected" = "Shutdown" ]; then
                    poweroff
                elif [ "$selected" = "Reboot" ]; then
                    reboot
                elif [ "$selected" = "Sleep" ]; then
                    systemctl suspend
                elif [ "$selected" = "Lock" ]; then
                    hyprlock
                elif [ "$selected" = "Cancel" ]; then
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

    xdg.userDirs.enable = true;

    home.stateVersion = "23.11";
}
