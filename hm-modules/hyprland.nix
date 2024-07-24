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
            ]
            ++ (
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
        };
    };
}
