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
                    "clock"
                ];
                modules-right = [
                    "cpu"
                    "memory"
                    "disk"
                    "network"
                    "bluetooth"
                    "wireplumber"
                    "battery"
                    "custom/exit"
                ];

                "hyprland/workspaces" = {
                    persistent-workspaces = {
                        "*" = 5;
                    };
                };

                "clock" = {
                    format = "{:%a %d %b %R}";
                    tooltip-format = "<tt><small>{calendar}</small></tt>";
                    calendar = {
                        mode = "year";
                        mode-mon-col = 3;
                        weeks-pos = "right";
                        format = {
                            months = "<span color='#d8dee9'><b>{}</b></span>";
                            days = "<span color='#81a1c1'><b>{}</b></span>";
                            weeks = "<span color='#a3be8c'><b>W{}</b></span>";
                            weekdays = "<span color='#ebcb8b'><b>{}</b></span>";
                            today = "<span color='#bf616a'><b><u>{}</u></b></span>";
                        };
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

                "network" = {
                    format-wifi = "{icon}  {essid}";
                    format-ethernet = "󰈀 ";
                    format-linked = "󰌷 ";
                    format-disconnected = "󰤭 ";
                    format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
                    tooltip-format = "{ifname}: {ipaddr}/{cidr}\nSignal Strength: {signalStrength}%";
                    on-click = "bash -c 'pgrep nmtui && pkill nmtui || ghostty --title nmtui_applet nmtui &'";
                    max-length = 50;
                };

                "bluetooth" = {
                    format = "󰂯";
                    format-disabled = "󰂲";
                    format-off = "󰂲";
                    format-connected = " {num_connections}";
                    tooltip-format = "{device_enumerate}";
                    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
                    on-click = "bash -c 'pgrep blueman-manage && pkill blueman-manage || blueman-manager &'";
                };

                "wireplumber" = {
                    format = "{icon} {volume}%";
                    format-muted = " 󰝟 ";
                    on-click = "bash -c 'pgrep pavucontrol && pkill pavucontrol || pavucontrol &'";
                    on-click-right = "wpctl set-mute @DEFAULT_SINK@ toggle";
                    format-icons = ["󰕿" "󰖀" "󰕾"];
                    scroll-step = 1;
                };

                "battery" = {
                    states = {
                        warning = 20;
                        critical = 10;
                    };
                    format = "{icon} {capacity}%";
                    format-charging = "󰂄 {capacity}%";
                    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
                    tooltip-format = "{timeTo}\nPower: {power} Watts";
                };

                "custom/exit" = {
                    format = " ";
                    on-click = "rofi-power-menu";
                    tooltip-format = "Power Menu";
                };
            };
        };
        style = ''
            * {
                border: none;
                border-radius: 15px;
                font-family: FiraCodeNerdFont;
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

            #clock,
            #temperature,
            #network,
            #bluetooth,
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

            #custom-exit {
                color: @error_color;
                margin: 0px 0px 0px 5px;
                font-size: 16px;
            }

            #network:hover,
            #bluetooth:hover,
            #wireplumber:hover {
                color: @theme_bg_color;
                background: @theme_selected_bg_color;
                transition: all 0.3s ease-in-out;
            }

            #battery.warning:not(.charging) {
                color: @warning_color;
            }

            #battery.critical:not(.charging),
            #bluetooth.disabled,
            #bluetooth.off,
            #network.disabled,
            #network.disconnected,
            #wireplumber.muted,
            #cpu.critical,
            #memory.critical,
            #disk.critical {
                color: @error_color;
            }
        '';
    };
}
