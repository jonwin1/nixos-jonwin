{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.file.".config/waybar" = {
    source = ../../dotconfig/waybar;
    recursive = true;
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    udiskie.enable = true;
  };
}
