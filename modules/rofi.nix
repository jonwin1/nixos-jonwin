{ user, ... }:
{
  home-manager.users.${user} =
    { config, pkgs, ... }:
    {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        location = "center";
        theme =
          let
            # Use `mkLiteral` for string-like values that should show without
            # quotes, e.g.:
            # {
            #   foo = "abc"; => foo: "abc";
            #   bar = mkLiteral "abc"; => bar: abc;
            # };
            inherit (config.lib.formats.rasi) mkLiteral;
          in
          {
            "window" = {
              width = 512;
              border = mkLiteral "2px";
              border-radius = mkLiteral "4px";
            };

            "inputbar" = {
              padding = mkLiteral "16px";
              children = map mkLiteral [ "entry" ];
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
          option="Cancel\nShutdown\nReboot\nSleep\nLock"
          selected=$(echo -e $option | rofi -dmenu -i)
          if [ "$selected" = "Shutdown" ]; then
              poweroff
          elif [ "$selected" = "Reboot" ]; then
              reboot
          elif [ "$selected" = "Sleep" ]; then
              systemctl suspend
          elif [ "$selected" = "Lock" ]; then
              hyprlock
          elif [ "$selected" = "Cancel" ]; then
              return
          fi
        '')
      ];
    };
}
