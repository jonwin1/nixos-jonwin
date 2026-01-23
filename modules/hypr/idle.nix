{ user, ... }:
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
          { # Dim screen
            timeout = 240; # 4min
            on-timeout = "light -O && light -S 10";
            on-resume = "light -I";
          }
          { # Turn off keyboard backlight
            timeout = 240; # 4min
            on-timeout = "light -s sysfs/leds/platform::kbd_backlight -O && light -s sysfs/leds/platform::kbd_backlight -S 0";
            on-resume = "light -s sysfs/leds/platform::kbd_backlight -I";
          }
          { # Screen off
            timeout = 300; # 5min
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on && light -I";
          }
          { # Suspend if locked
            timeout = 900; # 15min
            on-timeout = "pidof hyprlock && systemctl suspend";
          }
        ];
      };
    };
  };
}
