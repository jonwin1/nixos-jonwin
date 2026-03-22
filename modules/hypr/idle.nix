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
            on-timeout = "brightnessctl -sd amdgpu_bl2 set 10%";
            on-resume = "brightnessctl -rd amdgpu_bl2";
          }
          { # Turn off keyboard backlight
            timeout = 210; # 3.5min
            on-timeout = "brightnessctl -sd platform::kbd_backlight set 0";
            on-resume = "brightnessctl -rd platform::kbd_backlight";
          }
          { # Screen off
            timeout = 300; # 5min
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "brightnessctl -r && hyprctl dispatch dpms on";
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
