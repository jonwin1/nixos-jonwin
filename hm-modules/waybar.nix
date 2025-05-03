{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        margin-top = 5;
        margin-bottom = 0;
        margin-left = 10;
        margin-right = 10;
        spacing = 0;
        modules-left = [
          "hyprland/workspaces"
          "idle_inhibitor"
        ];
        modules-center = [
          "clock#date"
          "clock"
          "custom/pomodoro"
        ];
        modules-right = [
          "cpu"
          "memory"
          "disk"
          "tray"
          "wireplumber"
          "battery"
        ];

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "clock#date" = {
          format = "{:%a %d %b}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            format = {
              months = "<span color='#d8dee9'><b>{}</b></span>";
              days = "<span color='#81a1c1'><b>{}</b></span>";
              weekdays = "<span color='#ebcb8b'><b>{}</b></span>";
              today = "<span color='#bf616a'><b><u>{}</u></b></span>";
            };
          };
        };

        "clock" = {
          format = "{:%R}";
          tooltip = false;
        };

        "custom/pomodoro" = {
          format = "{}";
          signal = 10;
          return-type = "json";
          exec = "cat $HOME/.local/share/pomodoro/output.txt";
          on-click = "bash -c 'pgrep pomodoro && pkill pomodoro || pomodoro &'";
        };

        "idle_inhibitor" = {
          format = "{icon} ";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = false;
        };

        "cpu" = {
          format = "  {usage}% ";
          states = {
            critical = 90;
          };
        };

        "memory" = {
          format = "/   {percentage}% ";
          states = {
            critical = 80;
          };
        };

        "disk" = {
          format = "/ 󰋊 {percentage_used}% ";
          tooltip-format = "{used} / {total}";
          states = {
            critical = 95;
          };
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = " 󰝟 ";
          on-click = "bash -c 'pgrep pavucontrol && pkill pavucontrol || pavucontrol &'";
          on-click-right = "wpctl set-mute @DEFAULT_SINK@ toggle";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          scroll-step = 1;
        };

        "battery" = {
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{timeTo}\nPower: {power} Watts";
        };
      };
    };
    style = ''
      * {
          border: none;
          border-radius: 15px;
          font-family: FiraCode Nerd Font;
          font-size: 14px;
      }

      window#waybar {
          color: @theme_fg_color;
          background: transparent;
      }

      #workspaces {
          color: @theme_fg_color;
          background: @theme_bg_color;
          margin: 2px 1px 3px 1px;
          padding: 0px 1px;
      }

      #workspaces button {
          color: @theme_fg_color;
          background: transparent;
          padding: 0px 5px;
          margin: 4px 3px;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button.empty {
          color: alpha(@theme_fg_color, 0.5);
      }

      #workspaces button.visible {
          color: @theme_bg_color;
          background: alpha(@theme_selected_bg_color, 0.7);
      }

      #workspaces button.active {
          color: @theme_bg_color;
          background: @theme_selected_bg_color;
          min-width: 30px;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
          color: @theme_bg_color;
          background: alpha(@theme_selected_bg_color, 0.5);
      }

      tooltip {
          color: @theme_fg_color;
          background: alpha(@theme_bg_color, 0.9);
          padding: 15px;
          margin: 0px;
      }

      #idle_inhibitor {
          color: @success_color;
          font-size: 16px;
          margin-left: 15px;
      }

      #idle_inhibitor.activated {
          color: @error_color;
      }

      #clock.date,
      #clock,
      #custom-pomodoro,
      #tray,
      #wireplumber,
      #battery {
          color: @theme_fg_color;
          background: @theme_bg_color;
          padding: 5px 15px 4px 15px;
          margin: 5px 10px 5px 0px;
      }

      #disk {
          margin-right: 10px;
      }

      #tray > widget:hover,
      #custom-pomodoro:hover,
      #wireplumber:hover {
          color: @theme_bg_color;
          background: @theme_selected_bg_color;
          transition: all 0.3s ease-in-out;
      }

      #battery.warning:not(.charging) {
          color: @warning_color;
      }

      #battery.critical:not(.charging),
      #wireplumber.muted,
      #cpu.critical,
      #memory.critical,
      #disk.critical {
          color: @error_color;
      }
    '';
  };
}
