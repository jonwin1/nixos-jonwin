{ pkgs, user, ... }:
{
  home-manager.users.${user} = {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    gtk = {
      enable = true;

      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };

      iconTheme = {
        package = pkgs.nordzy-icon-theme;
        name = "Nordzy-dark";
      };

      font = {
        name = "FiraCode Nerd Font";
        size = 12;
      };
    };
  };
}
