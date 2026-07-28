{
  user,
  pkgs,
  lib,
  config,
  ...
}:
{
  home-manager.users.${user} = {
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
        ]
        ++ lib.optionals (config.jonwin.backlight != null) [
          {
            # Dim screen
            timeout = 240; # 4min
            on-timeout = "brightnessctl -sd ${config.jonwin.backlight} set 10%";
            on-resume = "brightnessctl -rd ${config.jonwin.backlight}";
          }
        ]
        ++ lib.optionals (config.jonwin.kbdBacklight != null) [
          {
            # Turn off keyboard backlight
            timeout = 210; # 3.5min
            on-timeout = "brightnessctl -sd ${config.jonwin.kbdBacklight} set 0";
            on-resume = "brightnessctl -rd ${config.jonwin.kbdBacklight}";
          }
        ];
      };
    };
    home.packages =
      with pkgs;
      lib.optionals (config.jonwin.backlight != null || config.jonwin.kbdBacklight != null) [
        brightnessctl
      ];
  };
}
