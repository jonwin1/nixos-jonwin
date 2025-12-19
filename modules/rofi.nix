{user, ...}: {
  home-manager.users.${user} = {
    config,
    pkgs,
    ...
  }: {
    programs.rofi = {
      enable = true;
      location = "center";
      theme = let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; => foo: "abc";
        #   bar = mkLiteral "abc"; => bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "window" = {
          width = 512;
          border = mkLiteral "2px";
          border-radius = mkLiteral "4px";
        };

        "inputbar" = {
          padding = mkLiteral "16px";
          children = map mkLiteral ["entry"];
        };

        "entry" = {
          placeholder = "...";
        };

        "listview" = {
          fixed-height = false;
        };

        "element" = {
          padding = mkLiteral "8px 16px";
        };
      };
    };

    home.packages = with pkgs; [
      (writeShellScriptBin "rofi-power-menu" ''
        options="󰜺    Cancel
            Shutdown
            Reboot
        󰤄    Suspend
            Hibernate
            Lock"

        choice="$(printf "%s\n" "$options" | rofi -dmenu -i)"

        case "$choice" in
          "󰜺    Cancel") return ;;
          "    Shutdown") systemctl poweroff ;;
          "    Reboot") systemctl reboot ;;
          "󰤄    Suspend") systemctl suspend ;;
          "    Hibernate") systemctl hibernate ;;
          "    Lock") hyprlock ;;
        esac
      '')

      (writeShellScriptBin "rofi-system-menu" ''
        toggle_idle() {
          if pgrep -x hypridle >/dev/null; then
            systemctl --user stop hypridle.service
            notify-send "Idle Inhibitor" "Enabled"
          else
            systemctl --user start hypridle.service
            notify-send "Idle Inhibitor" "Disabled"
          fi
        }

        toggle_hyprsunset() {
          CURRENT_TEMP=$(hyprctl hyprsunset temperature 2>/dev/null | grep -oE '[0-9]+')

          if [[ $CURRENT_TEMP == 6000 ]]; then
            hyprctl hyprsunset temperature 5000
            hyprctl hyprsunset gamma 80
            notify-send "Nightlight enabled"
          else
            hyprctl hyprsunset temperature 6000
            hyprctl hyprsunset gamma 100
            notify-send "Nightlight disabled"
          fi
        }

        # --- Menu entries ---
        entries="    Idle inhibitor toggle
        󰖔    Nightlight toggle
            Audio
            Wifi
        󰂯    Bluetooth
        "

        chosen=$(printf "%s" "$entries" | rofi -dmenu -i)

        case "$chosen" in
          *Idle*) toggle_idle ;;
          *Nightlight*) toggle_hyprsunset ;;
          *Audio*) jonwin-launch-or-focus pavucontrol ;;
          *Wifi*) jonwin-launch-or-focus-tui nmtui ;;
          *Bluetooth*) jonwin-launch-or-focus-tui bluetui ;;
        esac
      '')
    ];
  };
}
