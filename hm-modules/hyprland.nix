{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
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
                    size = 8;
                };
            };

            input = {
                kb_options = [ "compose:ralt" ];
            };
            
            misc = {
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                font_family = "FiraCodeNerdFont";
                vrr = 2;
                enable_swallow = true;
                swallow_regex = "kitty";
                swallow_exception_regex = "kitty";
            };

            cursor = {
                inactive_timeout = 2;
                no_hardware_cursors = true;
            };

            master = {
                allow_small_split = true;
                special_scale_factor = 0.6;
                mfact = 0.5;
            };

            layerrule = [
                "blur,waybar"
                "blur,notifications"
            ];

            exec-once = [
                "waybar"
                "/nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
                "wl-clip-persist --clipboard both"
            ];

            "$mod" = "SUPER";

            bind = [
                "$mod, W, exec, qutebrowser"
                "$mod, S, exec, kitty"
                "$mod, R, exec, rofi -show drun"
                "$mod SHIFT, R, exec, rofi -show run"
                "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
                "$mod, B, exec, rofi-rbw"
                "$mod, P, exec, grimblast --notify copysave output"
                "$mod SHIFT, P, exec, grimblast --notify copysave area"
                "$mod ALT, P, exec, grimblast --notify copysave active"
                "$mod CTRL, P, exec, grimblast --notify copysave screen"

                # scratchpad
                "$mod, D, togglespecialworkspace, magic"
                "$mod SHIFT, D, movetoworkspace, special:magic"

                "$mod, J, layoutmsg, cyclenext"
                "$mod, K, layoutmsg, cycleprev"
                "$mod SHIFT, J, layoutmsg, swapnext"
                "$mod SHIFT, K, layoutmsg, swapprev"
                "$mod, I, layoutmsg, addmaster"
                "$mod, U, layoutmsg, removemaster"

                #"$mod, P, pin, active"
                "$mod, M, fullscreen, 0"
                "$mod SHIFT, M, fullscreenstate, 0 2"
                "$mod, SPACE, togglefloating, active"
                "$mod, Q, killactive"
                "$mod SHIFT, Q, exec, rofi-power-menu"
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

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            xwayland = {
                force_zero_scaling = true;
            };
        };
    };
}
