{user, ...}: {
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
            timeout = 300;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on && light -I";
          }
          {
            timeout = 240;
            on-timeout = "light -O && light -S 10";
            on-resume = "light -I";
          }
          {
            timeout = 240;
            on-timeout = "light -s sysfs/leds/platform::kbd_backlight -O && light -s sysfs/leds/platform::kbd_backlight -S 0";
            on-resume = "light -s sysfs/leds/platform::kbd_backlight -I";
          }
        ];
      };
    };
  };
}
