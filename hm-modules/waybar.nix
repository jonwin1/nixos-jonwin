{
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar" = {
    source = ../dotconfig/waybar;
    recursive = true;
  };
}
