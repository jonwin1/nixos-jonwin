{ hostname, user, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland = {
      enable = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };

  home-manager.users.${user} = {
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
  };
}
