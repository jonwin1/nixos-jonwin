{
  user,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;

    image = ../wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  home-manager.users.${user} = {
    gtk = {
      enable = true;

      iconTheme = {
        package = pkgs.nordzy-icon-theme;
        name = "Nordzy-dark";
      };
    };
  };
}
