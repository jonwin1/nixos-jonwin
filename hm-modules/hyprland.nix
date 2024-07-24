{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            "$mod" = "SUPER";

            bind = [
                "$mod, W, exec, qutebrowser"
                "$mod, S, exec, kitty"

                "$mod, P, togglespecialworkspace, magic"
                "$mod SHIFT, P, movetoworkspace, special:magic"

                "$mod, H, movefocus, l"
                "$mod, L, movefocus, r"
                "$mod, K, movefocus, u"
                "$mod, J, movefocus, d"

                "$mod, Q, killactive"
                "$mod SHIFT, Q, exit"
            ] ++ (
                # workspaces
                # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
                builtins.concatLists (builtins.genList (
                    x: let
                        ws = let
                            c = (x + 1) / 10;
                        in
                            builtins.toString (x + 1 - (c * 10));
                    in [
                        "$mod, ${ws}, workspace, ${toString (x + 1)}"
                        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                    ]
                )
                10)
            );

            general = {
                border_size = 2;
                gaps_in = 0;
                gaps_out = 0;
            };

            decoration = {
                rounding = 5;
                drop_shadow = false;
                dim_inactive = true;
                dim_strength = 0.2;
            };
            
            misc = {
                #disable_hyprland_logo = true;
                enable_swallow = true;
                swallow_regex = "kitty";
            };

            cursor = {
                inactive_timeout = 2;
                #default_monitor
            };

            monitor = [
                "DP-3, 3440x1440@144, 1920x0, 1"
                "HDMI-A-2, 1920x1080@120, 0x0, 1"
            ];
        };
    };
}
