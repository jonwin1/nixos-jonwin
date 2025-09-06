{user, ...}: {
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
      settings = {
        monitor = [
          ", preferred, auto, 1"
        ];
      };
    };

    imports = [
      ./autostart.nix
      ./bindings.nix
      ./input.nix
      ./looknfeel.nix
      ./rules.nix
    ];
  };
}
