{user, ...}: {
  home-manager.users.${user}.programs.waybar.settings = [
    {
      height = 25;
      spacing = 0;

      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
        "custom/status_icons"
        # "custom/pomodoro"
      ];
      modules-right = [
        "tray"
        "wireplumber"
        "custom/temps"
        "cpu"
        "memory"
        "custom/disk"
        "battery"
      ];

      "hyprland/workspaces" = {
        show-special = true;
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
          wiki = "󰎞";
        };
      };

      "custom/status_icons" = {
        exec = "~/.config/waybar/scripts/status_icons.sh";
        interval = 5;
        tooltip = false;
      };

      clock = {
        format = "{:L%a %d %b %H.%M}";
        format-alt = "{:L%F v.%V}";
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

      "custom/temps" = {
        exec = "~/.config/waybar/scripts/temps.sh";
        interval = 5;
        return-type = "json";
        tooltip = true;
      };

      cpu = {
        format = "󰍛";
        interval = 5;
        states = {
          low = 30;
          medium = 60;
          high = 90;
        };
      };

      memory = {
        format = " ";
        tooltip-format = "Mem: {used:0.1f}/{total:0.1f} GiB ({percentage}%)\nSwp: {swapUsed:0.1f}/{swapTotal:0.1f} GiB ({swapPercentage}%)";
        interval = 5;
        states = {
          low = 30;
          medium = 60;
          high = 90;
        };
      };

      "custom/disk" = {
        exec = "~/.config/waybar/scripts/disk_info.sh";
        interval = 5;
        return-type = "json";
        tooltip = true;
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
        interval = 5;
        states = {
          warning = 20;
          critical = 10;
        };
      };
    }
  ];
}
