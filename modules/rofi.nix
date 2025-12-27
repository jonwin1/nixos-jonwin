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
    ];
  };
}
