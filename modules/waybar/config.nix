{user, ...}: {
  home-manager.users.${user}.programs.waybar.settings = [
    {
      height = 25;
      spacing = 0;

      modules-left = [
        "hyprland/workspaces"
        "idle_inhibitor"
      ];
      modules-center = [
        "clock"
        # "custom/pomodoro"
      ];
      modules-right = [
        "tray"
        "cpu"
        "memory"
        "disk"
        "wireplumber"
        "battery"
      ];

      "hyprland/workspaces" = {
        show-special = true;
        on-click = "activate";

        format = "{icon}";
        format-icons = {
          default = "";
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
          scratchpad = "";
          discord = "󰙯";
        };
      };

      idle_inhibitor = {
        format = "{icon} ";
        format-icons = {
          activated = "";
          deactivated = "";
        };
        tooltip = false;
      };

      clock = {
        format = "{:L%e %b %H.%M}";
        format-alt = "{:L%A v.%V %F}";
        tooltip = false;
      };

      # "custom/pomodoro": {
      #   "format": "{}",
      #   "signal": 10,
      #   "return-type": "json",
      #   "exec": "cat $HOME/.local/share/pomodoro/output.txt",
      #   "on-click": "bash -c 'pgrep pomodoro && pkill pomodoro || pomodoro &'",
      # },

      tray = {
        icon-size = 14;
        spacing = 12;
      };

      cpu = {
        format = "󰍛";
        on-click = "ghostty -e btop";
        states = {
          low = 30;
          medium = 60;
          high = 90;
        };
      };

      memory = {
        format = " ";
        on-click = "ghostty -e btop";
        states = {
          low = 30;
          medium = 60;
          high = 90;
        };
      };

      disk = {
        format = "󰋊";
        on-click = "ghostty -e btop";
        states = {
          low = 70;
          medium = 80;
          high = 90;
        };
      };

      wireplumber = {
        format = "{icon}";
        format-muted = "󰝟";
        format-icons = [
          "󰕿"
          "󰖀"
          "󰕾"
        ];
        scroll-step = 5;
        on-click = "bash -c 'pgrep pavucontrol && pkill pavucontrol || pavucontrol &'";
        on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        tooltip-format = "{node_name}\nVolume: {volume}%";
      };

      battery = {
        format = "{icon}";
        format-charging = "{icon}";
        format-full = "󰂅";
        format-icons = {
          charging = [
            "󰢜"
            "󰂆"
            "󰂇"
            "󰂈"
            "󰢝"
            "󰂉"
            "󰢞"
            "󰂊"
            "󰂋"
            "󰂅"
          ];
          default = [
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
        };
        tooltip-format-discharging = "{timeTo}\n{power:>1.0f}W↓ {capacity}%";
        tooltip-format-charging = "{timeTo}\n{power:>1.0f}W↑ {capacity}%";
        states = {
          warning = 20;
          critical = 10;
        };
      };
    }
  ];
}
