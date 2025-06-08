{ hostname, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
    '';
  };

  home.file = {
    ".config/hypr/hyprland-host.conf" = {
      source = ./hyprland-${hostname}.conf;
    };
  };
}
