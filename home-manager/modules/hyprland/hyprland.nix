{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = ''
      ${builtins.readFile ../../../dotconfig/hypr/hyprland.conf}
    '';
  };

  home.file = {
    ".config/hypr/hyprland-host.conf" = {
      source = ../../../dotconfig/hypr/hyprland-desktop.conf;
    };
  };
}
