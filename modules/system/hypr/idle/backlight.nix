{ self, ... }: {
  flake.nixosModules.hypridleBacklight = { config, ... }: {
    imports = [
      self.nixosModules.user
      self.nixosModules.backlight
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.hypridleBacklight
    ];
  };

  flake.homeModules.hypridleBacklight = { lib, my, ... }: {
    services.hypridle = {
      settings = {
        listener = [
          {
            # Dim screen
            timeout = 240; # 4min
            on-timeout = "brightnessctl -sd ${my.backlight} set 10%";
            on-resume = "brightnessctl -rd ${my.backlight}";
          }
        ]
        ++ lib.optionals (my.kbdBacklight != null) [
          {
            # Turn off keyboard backlight
            timeout = 210; # 3.5min
            on-timeout = "brightnessctl -sd ${my.kbdBacklight} set 0";
            on-resume = "brightnessctl -rd ${my.kbdBacklight}";
          }
        ];
      };
    };
  };
}
