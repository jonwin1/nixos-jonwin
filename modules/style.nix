{ pkgs, user, ... }:
{
  stylix = {
    enable = true;

    image = ../wallpaper.png;
    # polarity = "dark";

    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    fonts = {
      # font = {
      #   name = "FiraCode Nerd Font";
      #   size = 12;
      # };
      # noto-fonts noto-fonts-emoji nerd-fonts.caskaydia-mono
      serif = {
        # noto serif
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        # noto sans
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        # caskaydia mono nerf font
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    icons = {
      # enable = true;
      # package = pkgs.nordzy-icon-theme;
      # dark = "Nordzy-dark";
      # light = "";
    };
  };
}
