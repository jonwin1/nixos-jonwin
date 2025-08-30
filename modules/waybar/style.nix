{ user, lib, ... }:
{
  home-manager.users.${user} = {
    stylix.targets.waybar.addCss = false;
    programs.waybar.style = lib.concatStrings [
      ''
        * {
        	border: none;
        	border-radius: 0;
        	min-height: 0;
          font-size: 14px;
        }

        window#waybar, tooltip {
            background: @base00;
            color: @base05;
        }

        .modules-right {
          margin-right: 8px;
        }

        #workspaces button {
          all: initial;
          font-size: 18px;
          padding-left: 8px;
          padding-right: 10px;
          color: @base05;
        }

        #workspaces button.active {
        	color: @base0D; /* Blue */
        }

        #workspaces button.urgent {
          color: @base0A; /* Yellow */
        }

        #workspaces button.empty {
          opacity: 0.5;
        }

        #workspaces button.hosting-monitor.visible {
          background: @base02;
        }

        #idle_inhibitor,
        #tray,
        #cpu,
        #memory,
        #disk,
        #wireplumber,
        #battery {
          min-width: 12px;
          margin: 0 7.5px;
        }

        #custom-expand-icon {
          margin-right: 7px;
        }

        tooltip {
          padding: 2px;
        }

        #cpu,
        #memory,
        #disk {
        	color: @base0D; /* Blue */
        }

        #cpu.low,
        #memory.low,
        #disk.low {
        	color: @base0B; /* Green */
        }

        #idle_inhibitor.activated,
        #cpu.medium,
        #memory.medium,
        #disk.medium {
        	color: @base0A; /* Yellow */
        }

        #wireplumber.muted,
        #cpu.high,
        #memory.high,
        #disk.high {
        	color: @base08; /* Red */
        }

        #battery.warning:not(.charging) {
        	color: @base0A;
        }

        #battery.critical:not(.charging) {
        	color: @base08;
        }
      ''
    ];
  };
}
