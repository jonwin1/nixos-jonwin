{
  user,
  pkgs,
  config,
  ...
}:
{
  stylix = {
    enable = true;

    image = ../wallpaper.png;
    # polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-terminal-dark.yaml";

    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;

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
