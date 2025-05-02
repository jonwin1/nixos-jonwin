{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };

  security.pam.services.hyprlock = { };
}
