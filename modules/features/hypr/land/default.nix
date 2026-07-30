{ self, ... }: {
  flake.nixosModules.hyprland = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.hyprland
    ];

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
  };

  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
      systemd.enable = false;
      settings = {
        monitor = [
          ", preferred, auto, 1"
        ];
      };
    };
  };
}
