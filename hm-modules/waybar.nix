{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 25;
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
          all-outputs = true;
          move-to-monitor = true;

          format = "{icon} {windows}";
          format-icons = {
            "1" = "󰎤";
            "2" = "󰎧";
            "3" = "󰎪";
            "4" = "󰎭";
            "5" = "󰎱";
            "6" = "󰎳";
            "7" = "󰎶";
            "8" = "󰎹";
            "9" = "󰎼";
            "10" = "󰽽";
            "urgent" = "󱨇";
            "default" = "";
            "empty" = "󱓼";
          };

          window-rewrite-default = "";
          window-rewrite = {
            "class<Bitwarden>" = "󰞀";
            "class<.blueman-manager-wrapped>" = "";
            "class<code>" = "󰨞";
            "class<discord>" = "󰙯";
            "class<firefox>" = "";
            "class<floorp>" = "";
            "class<foot>" = "";
            "class<.*ghostty>" = "";
            "class<Github Desktop>" = "󰊤";
            "class<kitty>" = "";
            "class<pavucontrol>" = "";
            "class<Spotify>" = "";
            "class<steam>" = "";
            "class<thunar>" = "󰉋";
            "class<virt-manager>" = "󰢹";
            "class<Youtube Music>" = "";
            "title<Steam>" = "";
          };
        };

        "idle_inhibitor" = {
          format = "{icon} ";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = false;
        };

        "clock#date" = {
          format = "{:%a %d %b}";
          tooltip = false;
          # tooltip-format = "<tt><small>{calendar}</small></tt>";
          # calendar = {
          #   mode = "year";
          #   mode-mon-col = 3;
          #   format = {
          #     months = "<span color='#d8dee9'><b>{}</b></span>";
          #     days = "<span color='#81a1c1'><b>{}</b></span>";
          #     weekdays = "<span color='#ebcb8b'><b>{}</b></span>";
          #     today = "<span color='#bf616a'><b><u>{}</u></b></span>";
          #   };
          # };
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

        "cpu" = {
          format = "  {usage}%";
          states = {
            critical = 90;
          };
        };

        "memory" = {
          format = "  {percentage}%";
          states = {
            critical = 80;
          };
        };

        "disk" = {
          format = "󰋊 {percentage_used}%";
          tooltip-format = "{used} / {total}";
          states = {
            critical = 95;
          };
        };

        "tray" = {
          icon-size = 16;
          spacing = 15;
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
      @define-color black #1b1d2b;
      @define-color red #ff757f;
      @define-color green #c3e88d;
      @define-color yellow #ffc777;
      @define-color blue #82aaff;
      @define-color purple #c099ff;
      @define-color cyan #86e1fc;
      @define-color gray2 #828bb8;
      @define-color gray1 #444a73;

      @define-color background #222436;
      @define-color foreground #c8d3f5;
      @define-color selection-background #2d3f76;
      @define-color selection-foreground #c8d3f5;

      /* -----------------------------------------------------------------------------
       * Base styles
       * -------------------------------------------------------------------------- */

      /* Everything */
      * {
          border: none;
          border-radius: 0;
          min-height: 0;
          margin: 0;
          padding: 0;
          font-family: FiraCode Nerd Font;
          font-size: 14px;
      }

      /* The whole bar */
      window#waybar {
          color: white;
          background: #292e42;
      }

      /* Each module */
      #idle_inhibitor,
      #clock.date,
      #clock,
      #custom-pomodoro,
      #cpu,
      #memory,
      #disk,
      #tray,
      #wireplumber,
      #battery {
        padding-left: 10px;
        padding-right: 10px;
      }

      /* Hover */
      #workspaces button:hover,
      #custom-pomodoro:hover,
      #tray > widget:hover,
      #wireplumber:hover {
          background-color: #394b70;
      }

      /* Warning */
      #idle_inhibitor.activated,
      #battery.warning:not(.charging) {
          color: #ff9e64;
      }

      /* Critical */
      #battery.critical:not(.charging),
      #wireplumber.muted,
      #cpu.critical,
      #memory.critical,
      #disk.critical {
          color: #c53b53;
      }

      /* -----------------------------------------------------------------------------
       * Module styles
       * -------------------------------------------------------------------------- */

      #workspaces button {
          border-top: 2px solid transparent;
          padding-left: 10px;
          padding-right: 10px;
      }

      #workspaces button.active {
          border-color: #7aa2f7;
          color: white;
          background-color: #394b70;
      }

      #workspaces button.urgent {
          border-color: #ffc777;
          color: #ff9e64;
      }

      tooltip {
          color: white;
          background: #292e42;
          padding: 15px;
          margin: 0px;
      }

      #idle_inhibitor {
          color: #7aa2f7;
      }

      #clock.date {
      }

      #clock {
        font-family: FiraCode Nerd Font Bold;
      }

      #custom-pomodoro {
      }

      #cpu {
      }

      #memory {
      }

      #disk {
      }

      #tray {
      }

      #tray menu * {
          padding: 0px 5px;
      }

      #wireplumber {
      }

      #battery {
      }
    '';
  };
}
