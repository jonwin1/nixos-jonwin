{ user, pkgs, ... }:
{
    imports = [
        ../hm-modules
    ];

    home = {
        username = "${user}";
        homeDirectory = "/home/${user}";
        file = {
            "backgrounds" = {
                source = ../backgrounds;
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
        random-background = {
            enable = true;
            display = "fill";
            imageDirectory = "%h/backgrounds";
            interval = "1h";
        };
    };

    programs = {
        home-manager.enable = true;
    };

    home.stateVersion = "23.11";
}
