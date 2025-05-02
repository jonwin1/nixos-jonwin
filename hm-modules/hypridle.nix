{
  services.hypridle = {
    enable = true;
  };
  home.file.".config/hypr/hypridle.conf" = {
    source = ../dotconfig/hypr/hypridle.conf;
  };
}
