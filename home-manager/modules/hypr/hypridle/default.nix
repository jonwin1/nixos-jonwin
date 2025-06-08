{
  services.hypridle = {
    enable = true;
  };
  home.file.".config/hypr/hypridle.conf" = {
    source = ./hypridle.conf;
  };
}
