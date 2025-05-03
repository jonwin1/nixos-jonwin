{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ../dotconfig/hypr/hyprland.conf}
    '';
  };
}
