{
  user,
  lib,
  ...
}: {
  home-manager.users.${user} = {
    stylix.targets.waybar.addCss = false;
    programs.waybar.style = lib.concatStrings [
      ''
        * {
          border: none;
          border-radius: 0;
          min-height: 0;
          font-size: 12pt;
        }

        window#waybar, tooltip {
            background: alpha(@base00, 0.9);
            color: @base05;
        }

        .modules-right {
          margin-right: 8px;
        }

        #workspaces button {
          all: initial;
          font-size: 18pt;
          padding-left: 8px;
          padding-right: 10px;
          color: @base05;
        }

        #workspaces button.visible {
          color: @base0B; /* Green */
        }

        #workspaces button.active {
          color: @base0D; /* Blue */
        }

        #workspaces button.urgent {
          color: @base0A; /* Yellow */
        }

        #idle_inhibitor,
        #tray,
        #custom-temps,
        #cpu,
        #memory,
        #disk,
        #wireplumber,
        #battery {
          min-width: 12px;
          margin: 0 7.5px;
        }

        tooltip {
          padding: 2px;
        }

        tooltip label {
          color: @base05;
        }

        #custom-temps.cool,
        #cpu,
        #memory,
        #disk {
          color: @base0D; /* Blue */
        }

        #custom-temps.warm,
        #cpu.low,
        #memory.low,
        #disk.low {
          color: @base0B; /* Green */
        }

        #idle_inhibitor.activated,
        #custom-temps.hot,
        #cpu.medium,
        #memory.medium,
        #disk.medium,
        #battery.warning:not(.charging) {
          color: @base0A; /* Yellow */
        }

        #wireplumber.muted,
        #custom-temps.critical,
        #cpu.high,
        #memory.high,
        #disk.high,
        #battery.critical:not(.charging) {
          color: @base08; /* Red */
        }
      ''
    ];
  };
}
