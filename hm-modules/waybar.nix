{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                modules-left = [
                    "hyprland/workspaces"
                    "idle_inhibitor"
                ];
                modules-center = [
                    "clock"
                ];
                modules-right = [
                    "cpu"
                    "temperature"
                    "memory"
                    "disk"
                    "network"
                    "bluetooth"
                    "wireplumber"
                    "battery"
                ];

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
                    interval = 5;
                    format = " {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7} ";
                    format-icons = [
                        "<span color='#a3be8c'>▁</span>"
                        "<span color='#81a1c1'>▂</span>"
                        "<span color='#81a1c1'>▃</span>"
                        "<span color='#ebcb8b'>▄</span>"
                        "<span color='#ebcb8b'>▅</span>"
                        "<span color='#d08770'>▆</span>"
                        "<span color='#d08770'>▇</span>"
                        "<span color='#bf616a'>█</span>"
                    ];
                };

                "temperature" = {
                    thermal-zone = 3;
                    format = "{icon} {temperatureC}°C";
                    format-icons = ["" "" "" "" ""];
                    interval = 5;
                    tooltip = false;
                    critical-threshold = 80;
                };

                "memory" = {
                    interval = 5;
                    format = "  {percentage}%";
                    states = {
                        critical = 90;
                    };
                };

                "disk" = {
                    format = "󰋊 {free}";
                    tooltip-format = "{used} used out of {total}";
                    states = {
                        critical = 95;
                    };
                };

                "network" = {
                    format-wifi = "{icon} {essid}";
                    format-ethernet = "󰈀 ";
                    format-linked = "󰌷 ";
                    format-disconnected = "󰤭 ";
                    format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
                    tooltip-format = "{ifname}: {ipaddr}/{cidr}\nSignal Strength: {signalStrength}%";
                    on-click = "kitty nmtui";
                    max-length = 50;
                };
                
                "bluetooth" = {
                    format = "󰂯";
                    format-disabled = "";
                    format-off = "";
                    format-connected = " {num_connections}";
                    tooltip-format = "{device_enumerate}";
                    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
                    on-click = "blueman-manager";
                };

                "wireplumber" = {
                    format = "{icon} {volume}%";
                    format-muted = " 󰝟 ";
                    on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
                    format-icons = ["󰕿" "󰖀" "󰕾"];
                    scroll-step = 5;
                };

                "battery" = {
                    states = {
                        warning = 20;
                        critical = 10;
                    };
                    format = "{icon} {capacity}%";
                    format-charging = "󰂄 {capacity}%";
                    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
                    tooltip-format = "{timeTo}\nPower: {power} Watts\nHealth: {health}%";
                };
            };
        };

        style = ''
            * {
                border: none;
                border-radius: 0;
                font-family: FiraCodeNerdFont;
                font-size: 13px;
            }

            window#waybar {
                color: @theme_fg_color;
                background: alpha(@theme_bg_color, 0.5);
            }

            tooltip {
                color: @theme_fg_color;
                background: alpha(@theme_bg_color, 0.9);
                border: 1px solid alpha(@borders, 0.9);
                border-radius: 10px;
            }

            #workspaces {
                color: @theme_fg_color;
                background: @theme_bg_color;
                border-radius: 10px;
                margin: 5px;
            }
            
            #workspaces button {
                color: alpha(@theme_fg_color, 0.4);
                background: transparent;
            }

            #workspaces button.visible {
                color: @theme_selected_fg_color;
                background: alpha(@theme_selected_bg_color, 0.5);
                border-radius: 10px;
            }

            #workspaces button:hover {
                color: @theme_fg_color;
            }

            #workspaces button.urgent {
                color: @warning_color;
            }

            #idle_inhibitor,
            #clock,
            #cpu,
            #temperature,
            #memory,
            #disk,
            #network,
            #bluetooth,
            #wireplumber,
            #battery {
                color: @theme_fg_color;
                background: @theme_bg_color;
                border-radius: 10px;
                padding: 0px 10px;
                margin: 5px 5px 5px 0px;
            }

            #network:hover,
            #bluetooth:hover,
            #wireplumber:hover,
            #idle_inhibitor:hover {
                color: @theme_selected_fg_color;
                background: alpha(@theme_selected_bg_color, 0.5);
                border-radius: 10px;
            }

            #idle_inhibitor,
            #bluetooth.discovering,
            #battery.charging {
                color: @success_color;
            }

            #idle_inhibitor.activated,
            battery.warning {
                color: @warning_color;
            }

            #network.disabled,
            #network.disconnected,
            #wireplumber.muted,
            #memory.critical,
            #disk.critical,
            #battery.critical,
            #temperature.critical {
                color: @error_color;
            }

            #wireplumber {
                min-width: 50px;
            }

            #battery.warning:not(.charging) {
                color: @warning_color;
            }
            #battery.critical:not(.charging) {
                color: @error_color;
            }
        '';
    };
}
