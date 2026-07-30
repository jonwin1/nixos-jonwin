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

  flake.homeModules.hyprland = { pkgs, ... }: {
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

    home.packages = with pkgs; [
      cliphist
      wl-clipboard
      wl-clip-persist

      hyprpolkitagent
      kdePackages.qtwayland
      qt5.qtwayland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
