{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            "$mod" = "SUPER";

            bind = [
                "$mod, W, exec, qutebrowser"
                "$mod, S, exec, kitty"

                # scratchpad
                "$mod, P, togglespecialworkspace, magic"
                "$mod SHIFT, P, movetoworkspace, special:magic"

                "$mod, J, layoutmsg, cyclenext"
                "$mod, K, layoutmsg, cycleprev"
                "$mod SHIFT, J, layoutmsg, swapnext"
                "$mod SHIFT, K, layoutmsg, swapprev"
                "$mod, I, layoutmsg, addmaster"
                "$mod, U, layoutmsg, removemaster"

                "$mod, M, fullscreen, 0"
                "$mod SHIFT, M, fakefullscreen, "
                "$mod SHIFT, SPACE, togglefloating, active"
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

            binde = [
                "$mod, H, layoutmsg, mfact -0.05"
                "$mod, L, layoutmsg, mfact +0.05"
            ];

            bindl = [
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ", XF86AudioPrev, exec, playerctl previous"
                ", XF86AudioNext, exec, playerctl next"
                ", XF86AudioPause, exec, playerctl pause"
                ", XF86AudioPlay, exec, playerctl play-pause"
                ", XF86AudioStop, exec, playerctl stop"
            ];

            bindel = [
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ", XF86MonBrightnessUp, exec, light -A 5"
                ", XF86MonBrightnessDown, exec, light -U 5"
            ];

            general = {
                border_size = 2;
                gaps_in = 0;
                gaps_out = 0;
                layout = "master";
                "col.inactive_border" = "0xff2e3440";
                "col.active_border" = "0xff81a1c1";
            };

            decoration = {
                rounding = 5;
                drop_shadow = false;
                dim_inactive = true;
                dim_strength = 0.2;
                blur = {
                    enabled = true;
                    size = 10;
                };
            };
            
            misc = {
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                font_family = "FiraCodeNerdFont";
                vrr = 2;
                # enable_swallow = true;
                # swallow_regex = "kitty";
                # swallow_exception_regex = "kitty";
            };

            cursor = {
                inactive_timeout = 2;
            };

            master = {
                special_scale_factor = 0.6;
                mfact = 0.55;
            };

            exec-once = [
                "waybar &"
            ];
        };
    };
}
