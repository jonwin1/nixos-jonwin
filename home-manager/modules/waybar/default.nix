{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.file = {
    ".config/waybar/config.jsonc" = {
      source = ./config.jsonc;
    };
    ".config/waybar/style.css" = {
      source = ./style.css;
    };
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    udiskie.enable = true;
  };
}
