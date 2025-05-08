{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.file.".config/waybar" = {
    source = ../dotconfig/waybar;
    recursive = true;
  };
}
