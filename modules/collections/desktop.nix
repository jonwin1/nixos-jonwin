{ self, inputs, ... }: {
  flake.nixosModules.desktop = { config, ... }: {
    imports = with self.nixosModules; [
      audio
      bluetooth
      dunst
      ghostty
      jwmenu
      rofi
      scripts
      sddm
      small
      stylix
      swayosd
      thunar
      virtualization
      zen-browser
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

      inputs.pomodoro.packages.${stdenv.hostPlatform.system}.default
    ];
  };
}
