{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                modules-left = [
                    "hyprland/workspaces"
                ];
                modules-center = [
                    "clock"
                ];
                modules-right = [
                    "idle_inhibitor"
                    "cpu"
                    "temperature"
                    "memory"
                    "disk"
                    "network"
                    "bluetooth"
                    "wireplumber"
                    "battery"
                    "custom/power"
                ];

                "battery" = {
                    states = {
                        warning = 20;
                        critical = 10;
                    };
                    format = "{icon} {capacity}%";
                    format-icons = ["" "" "" "" ""];
                };

                "bluetooth" = {
                    format = "󰂯";
                    format-disabled = "";
                    format-off = "";
                    format-connected = " {num_connections}";
                    tooltip-format = "{device_enumerate}";
                    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
                };

                "cpu" = {
                    interval = 1;
                    format = " {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}";
                    format-icons = [
                        "<span color='#69ff94'>▁</span>"
                        "<span color='#2aa9ff'>▂</span>"
                        "<span color='#f8f8f2'>▃</span>"
                        "<span color='#f8f8f2'>▄</span>"
                        "<span color='#ffffa5'>▅</span>"
                        "<span color='#ffffa5'>▆</span>"
                        "<span color='#ff9977'>▇</span>"
                        "<span color='#dd532e'>█</span>"
                    ];
                };

                "clock" = {
                    interval = 1;
                    format = "{:%a %d %b %T}";
                    tooltip-format = "<tt><small>{calendar}</small></tt>";
                    calendar = {
                        mode = "year";
                        mode-mon-col = 3;
                        weeks-pos = "right";
                        on-scroll = 1;
                        format = {
                            months = "<span color='#d8dee9'><b>{}</b></span>";
                            days = "<span color='#81a1c1'><b>{}</b></span>";
                            weeks = "<span color='#a3be8c'><b>W{}</b></span>";
                            weekdays = "<span color='#ebcb8b'><b>{}</b></span>";
                            today = "<span color='#bf616a'><b><u>{}</u></b></span>";
                        };
                    };
                    actions = {
                        on-click-right = "mode";
                        on-click-left = "shift_reset";
                        on-scroll-up = "shift_up";
                        on-scroll-down = "shift_down";
                    };
                };

                "custom/power" = {
                    format = "󰐥";
                    on-click = "kitty";
                    tooltip = false;
                };

                "disk" = {
                    format = "󰋊 {free}";
                    tooltip-format = "{used} used out of {total}";
                };

                "idle_inhibitor" = {
                    format = "{icon} ";
                    format-icons = {
                        activated = "";
                        deactivated = "";
                    };
                };

                "memory" = {
                    format = "  {percentage}%";
                };

                "network" = {
                    format-wifi = "{icon} {essid}";
                    format-ethernet = "󰈀";
                    format-linked = "󰌷";
                    format-disconnected = "󰤭";
                    format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
                };
                
                "temperature" = {
                    format = " {temperatureC}°C";
                };

                "wireplumber" = {
                    format = "{icon} {volume}%";
                    format-muted = "󰝟";
                    on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
                    format-icons = ["󰕿" "󰖀" "󰕾"];
                    scroll-step = 5;
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

            #clock,
            #idle_inhibitor,
            #cpu,
            #temperature,
            #memory,
            #disk,
            #network,
            #bluetooth,
            #wireplumber,
            #battery,
            #custom-power {
                color: @theme_fg_color;
                background: @theme_bg_color;
                background-color: alpha(@theme_bg_color, 0.85);
                border-radius: 10px;
                padding: 0px 10px;
                margin: 5px 5px 5px 0px;
            }

            #wireplumber {
                min-width: 50px;
            }

            #custom-power {
                background-color: @theme_bg_color;
            }

            #custom-power button:hover {
                color: @theme_selected_fg_color;
                background: alpha(@theme_selected_bg_color, 0.5);
                border-radius: 10px;
            }

            #idle_inhibitor.activated {
                color: @success_color;
            }

            #wireplumber.muted {
                color: @error_color;
            }

            #battery.charging {
                color: @success_color;
            }
            #battery.warning:not(.charging) {
                color: @warning_color;
            }
            #battery.critical:not(.charging) {
                color: @error_color;
            }

            #temperature.critical {
                color: @error_color;
            }
        '';
    };
}
