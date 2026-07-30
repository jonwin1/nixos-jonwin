{ self, ... }: {
  flake.nixosModules.hypridle = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.hypridle
    ];
  };

  flake.homeModules.hypridle = {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            # Screen off
            timeout = 300; # 5min
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            # Suspend if locked
            timeout = 900; # 15min
            on-timeout = "pidof hyprlock && systemctl suspend";
          }
        ];
      };
    };
  };
}
