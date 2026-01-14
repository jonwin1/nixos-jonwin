{
  config,
  lib,
  user,
  ...
}: {
  home-manager.users.${user}.programs.waybar.settings = [
    {
      inherit (config.jonwin.waybar) output;

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

      modules-right =
        [
          "tray"
          "network"
          "bluetooth"
          "wireplumber"
          "custom/temps"
          "cpu"
          "memory"
          "custom/disk"
        ]
        ++ lib.optionals config.jonwin.hasBattery ["battery"];

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

      network = {
        interval = 5;
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        format = "{icon}";
        format-wifi = "{icon}";
        format-ethernet = "󰈀";
        format-linked = "󰌷";
        format-disconnected = "󰤮";
        format-disabled = "󰤮";
        tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        tooltip-format-disconnected = "Disconnected";
        tooltip-format-disabled = "Disabled";
      };

      bluetooth = {
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-on = "";
        format-connected = "󰂱";
        format-no-controller = "";
        tooltip-format = "No connected devices";
        tooltip-format-connected = "{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}";
        tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
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
        on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        tooltip-format = "{node_name}\nVolume: {volume}%";
      };

      battery = lib.mkIf config.jonwin.hasBattery {
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
