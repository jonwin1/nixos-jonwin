{ self, inputs, ... }: {
  flake.nixosModules.desktopProfile = { config, ... }: {
    imports = with self.nixosModules; [
      smallProfile

      audio
      bluetooth
      dunst
      ghostty
      jwmenu
      rofi
      scripts
      sddm
      stylix
      swayosd
      thunar
      virtualization
      zenBrowser
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.desktop
    ];

    xdg.mime.defaultApplications = {
      "application/pdf" = "org.kde.okular.desktop";
      "image/png" = "gimp.desktop";
      "image/jpeg" = "gimp.desktop";
    };

    services.logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      HandlePowerKey = "ignore";
      HandleLidSwitch = "ignore";
    };
  };

  flake.homeModules.desktop = { pkgs, ... }: {
    home.packages = with pkgs; [
      discord
      gimp
      kdePackages.okular

      cliphist
      wl-clipboard
      wl-clip-persist

      inputs.pomodoro.packages.${stdenv.hostPlatform.system}.default
    ];
  };
}
