{
  programs.hyprlock = {
    enable = true;
  };
  home.file = {
    ".config/hypr/hyprlock.conf" = {
      source = ../../../dotconfig/hypr/hyprlock.conf;
    };
    "Pictures/logo.png" = {
      source = ../../../logo.png;
    };
    ".config/scripts" = {
      source = ../../../dotconfig/scripts;
      recursive = true;
    };
  };
}
