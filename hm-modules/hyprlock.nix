{
  programs.hyprlock = {
    enable = true;
  };
  home.file.".config/hypr/hyprlock.conf" = {
    source = ../dotconfig/hypr/hyprlock.conf;
  };
}
