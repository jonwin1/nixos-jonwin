{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            general = {
                border_size = 2;
                gaps_in = 0;
                gaps_out = 0;
                "col.inactive_border" = "0xff2e3440";
                "col.active_border" = "0xff81a1c1";
                layout = "master";
                resize_on_border = true;
            };

            decoration = {
                rounding = 5;
                dim_inactive = true;
                dim_strength = 0.2;
            };

            input = {
                kb_options = [ "compose:ralt" ];
            };

            gestures = {
                workspace_swipe = true;
                workspace_swipe_use_r = true;
            };
            
            misc = {
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
                special_scale_factor = 0.6;
                mfact = 0.4;
                orientation = "center";
                always_center_master = true;
            };

            layerrule = [
                "blur,waybar"
                "blur,notifications"
            ];

            windowrulev2 = [
                "float, title:(Bluetooth Devices)"
                "size 600 400, title:(Bluetooth Devices)"
                "move 100%-w-10 40, title:(Bluetooth Devices)"
                "pin, title:(Bluetooth Devices)"
                "noborder on, title:(Bluetooth Devices)" 
                "dimaround on, title:(Bluetooth Devices)" 

                "float, title:(nmtui)"
                "size 600 400, title:(nmtui)"
                "move 100%-w-10 40, title:(nmtui)"
                "pin, title:(nmtui)"
                "noborder on, title:(nmtui)" 
                "dimaround on, title:(nmtui)" 
            ];

            exec-once = [
                "waybar"
                "systemctl --user start hyprpolkitagent"
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

                "$mod, A, pin, active"
                "$mod, M, fullscreen, 0"
                "$mod SHIFT, M, fullscreenstate, 0 2"
                "$mod, SPACE, togglefloating, active"
                "$mod, Q, killactive"
                "$mod SHIFT, Q, exec, rofi-power-menu"
            ] ++ (
                # workspaces
                # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
                builtins.concatLists (builtins.genList (i:
                        let ws = i + 1;
                    in [
                        "$mod, code:1${toString i}, workspace, ${toString ws}"
                        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
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
