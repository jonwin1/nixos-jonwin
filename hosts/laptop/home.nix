{ ... }:
{
  imports = [ ];
  services = {
    batsignal = {
      enable = true;
      extraArgs = [ ];
    };
  };

  home.file = {
    ".config/hypr/hyprland-host.conf" = {
      source = ../../dotconfig/hypr/hyprland-laptop.conf;
    };
  };
}
