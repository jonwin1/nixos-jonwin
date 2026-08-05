{
  flake.wrappers.mangowc = {
    settings = {
      bind =
        let
          mod = "SUPER";
        in
        [
          # Applications
          "${mod}, x, spawn, ghostty"
          "${mod}, b, spawn, zen-beta"
          "${mod}, e, spawn, thunar"
          "${mod}, u, spawn, yubioath-flutter"

          "${mod},       r, spawn, rofi -show drun"
          "${mod}+SHIFT, r, spawn, rofi -show run"
          "${mod},       v, spawn_shell, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

          # Quit
          "${mod},       q,            killclient"
          # "${mod}+SHIFT, q,            spawn, jwmenu ~/.config/jwmenu/power.toml"
          "${mod}+SHIFT, q,            quit"
          "NONE,         XF86PowerOff, spawn, jwmenu ~/.config/jwmenu/power.toml"

          "${mod},       Space, spawn, jwmenu ~/.config/jwmenu/system.toml"

          # switch window focus
          "SUPER, Tab, focusstack, next"
          "ALT, Left, focusdir, left"
          "ALT, Right, focusdir, right"
          "ALT, Up, focusdir, up"
          "ALT, Down, focusdir, down"

          # swap window
          "SUPER+SHIFT, Up, exchange_client, up"
          "SUPER+SHIFT, Down, exchange_client, down"
          "SUPER+SHIFT, Left, exchange_client, left"
          "SUPER+SHIFT, Right, exchange_client, right"

          # switch window status
          "SUPER, g, toggleglobal, "
          "ALT, Tab, togglejump, "
          "ALT, backslash, togglefloating, "
          "ALT, a, togglemaximizescreen, "
          "ALT, f, togglefullscreen, "
          "ALT+SHIFT, f, togglefakefullscreen, "
          "SUPER, i, minimized, "
          "SUPER, o, toggleoverlay, "
          "SUPER+SHIFT, I, restore_minimized"
          "ALT, z, toggle_scratchpad"

          # scroller layout
          "ALT, e, set_proportion, 1.0"
          "ALT, x, switch_proportion_preset, "
          "alt+super+ctrl, Left, scroller_stack, left"
          "alt+super+ctrl, Right, scroller_stack, right"
          "alt+super+ctrl, Up, scroller_stack, up"
          "alt+super+ctrl, Down, scroller_stack, down"

          #dwindle layout(manual split mode)
          "alt+shift, Return, dwindle_toggle_split_direction"

          # switch layout
          "SUPER, n, switch_layout"

          # tag switch
          "SUPER, Left, viewtoleft, 0"
          "CTRL, Left, viewtoleft_have_client, 0"
          "SUPER, Right, viewtoright, 0"
          "CTRL, Right, viewtoright_have_client, 0"
          "CTRL+SUPER, Left, tagtoleft, 0"
          "CTRL+SUPER, Right, tagtoright, 0"

          "Ctrl, 1, view, 1, 0"
          "Ctrl, 2, view, 2, 0"
          "Ctrl, 3, view, 3, 0"
          "Ctrl, 4, view, 4, 0"
          "Ctrl, 5, view, 5, 0"
          "Ctrl, 6, view, 6, 0"
          "Ctrl, 7, view, 7, 0"
          "Ctrl, 8, view, 8, 0"
          "Ctrl, 9, view, 9, 0"

          # tag: move client to the tag and focus it
          # tagsilent: move client to the tag and not focus it
          # bind=Alt, 1, tagsilent, 1
          "Alt, 1, tag, 1, 0"
          "Alt, 2, tag, 2, 0"
          "Alt, 3, tag, 3, 0"
          "Alt, 4, tag, 4, 0"
          "Alt, 5, tag, 5, 0"
          "Alt, 6, tag, 6, 0"
          "Alt, 7, tag, 7, 0"
          "Alt, 8, tag, 8, 0"
          "Alt, 9, tag, 9, 0"

          # monitor switch
          "alt+shift, Left, focusmon, left"
          "alt+shift, Right, focusmon, right"
          "SUPER+Alt, Left, tagmon, left"
          "SUPER+Alt, Right, tagmon, right"

          # gaps
          "ALT+SHIFT, X, incgaps, 1"
          "ALT+SHIFT, Z, incgaps, -1"
          "ALT+SHIFT, R, togglegaps"

          # movewin
          "CTRL+SHIFT, Up, movewin, +0, -50"
          "CTRL+SHIFT, Down, movewin, +0, +50"
          "CTRL+SHIFT, Left, movewin, -50, +0"
          "CTRL+SHIFT, Right, movewin, +50, +0"

          # resizewin
          "CTRL+ALT, Up, resizewin, +0, -50"
          "CTRL+ALT, Down, resizewin, +0, +50"
          "CTRL+ALT, Left, resizewin, -50, +0"
          "CTRL+ALT, Right, resizewin, +50, +0"
        ];

      # Mouse Button Bindings
      # btn_left and btn_right can't bind none mod key
      mousebind = [
        "SUPER, btn_left, moveresize, curmove"
        "NONE, btn_middle, togglemaximizescreen, 0"
        "SUPER, btn_right, moveresize, curresize"
      ];

      # Axis Bindings
      axisbind = [
        "SUPER, UP, viewtoleft_have_client"
        "SUPER, DOWN, viewtoright_have_client"
      ];
    };
  };
}
