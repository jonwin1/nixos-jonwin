{
  flake.wrappers.mangowc = {
    settings =
      let
        mod = "super";
      in
      {
        bind = [
          # Applications
          "${mod}, x, spawn, ghostty"
          "${mod}, b, spawn, zen-beta"
          "${mod}, e, spawn, thunar"
          "${mod}, u, spawn, yubioath-flutter"

          # "${mod}, r, spawn, rofi -show drun"
          # "${mod}+shift, r, spawn, rofi -show run"
          # "${mod}, v, spawn_shell, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          # "${mod}, Space, spawn, jwmenu ~/.config/jwmenu/system.toml"

          "${mod}, r, spawn, noctalia msg panel-toggle launcher"
          "${mod}, space, spawn, noctalia msg panel-toggle control-center"
          "${mod}, comma, spawn, noctalia msg settings-toggle"

          # Quit
          "${mod}, q, killclient"
          "${mod}+shift, q, spawn, noctalia msg panel-toggle session"
          # "${mod}+shift, q, spawn, jwmenu ~/.config/jwmenu/power.toml"
          # "none, XF86PowerOff, spawn, jwmenu ~/.config/jwmenu/power.toml"

          # switch window focus
          "${mod}, h, focusdir, left"
          "${mod}, l, focusdir, right"
          "${mod}, k, focusdir, up"
          "${mod}, j, focusdir, down"

          # swap window
          "${mod}+shift, h, exchange_client, left"
          "${mod}+shift, l, exchange_client, right"
          "${mod}+shift, k, exchange_client, up"
          "${mod}+shift, j, exchange_client, down"

          # switch window status
          "${mod}, p, toggleglobal, " # Show on all tags
          "${mod}, o, toggleoverlay, " # Show on top of windows
          "${mod}, f, togglefloating, "
          "${mod}, m, togglemaximizescreen, "
          "${mod}+shift, m, togglefullscreen, "
          "${mod}+alt, m, togglefakefullscreen, "
          "${mod}, i, minimized, "
          "${mod}+shift, i, restore_minimized"
          "${mod}, z, toggle_scratchpad"

          # scroller layout
          "${mod}, s, switch_proportion_preset, "
          # "alt+super+ctrl, Left, scroller_stack, left"
          # "alt+super+ctrl, Right, scroller_stack, right"
          # "alt+super+ctrl, Up, scroller_stack, up"
          # "alt+super+ctrl, Down, scroller_stack, down"

          #dwindle layout(manual split mode)
          "${mod}, s, dwindle_toggle_split_direction"

          # switch layout
          "${mod}, n, switch_layout"

          # tag switch
          "${mod}, 1, view, 1, 0"
          "${mod}, 2, view, 2, 0"
          "${mod}, 3, view, 3, 0"
          "${mod}, 4, view, 4, 0"
          "${mod}, 5, view, 5, 0"
          "${mod}, 6, view, 6, 0"
          "${mod}, 7, view, 7, 0"
          "${mod}, 8, view, 8, 0"
          "${mod}, 9, view, 9, 0"
          "${mod}, 0, togglejump, "

          # tag: move client to the tag and focus it
          # tagsilent: move client to the tag and not focus it
          # bind=Alt, 1, tagsilent, 1
          "${mod}+shift, 1, tag, 1, 0"
          "${mod}+shift, 2, tag, 2, 0"
          "${mod}+shift, 3, tag, 3, 0"
          "${mod}+shift, 4, tag, 4, 0"
          "${mod}+shift, 5, tag, 5, 0"
          "${mod}+shift, 6, tag, 6, 0"
          "${mod}+shift, 7, tag, 7, 0"
          "${mod}+shift, 8, tag, 8, 0"
          "${mod}+shift, 9, tag, 9, 0"

          # monitor switch
          "${mod}+alt, h, focusmon, left"
          "${mod}+alt, l, focusmon, right"
          "${mod}+alt+shift, h, tagmon, left"
          "${mod}+alt+shift, l, tagmon, right"

          # gaps
          "${mod}, g, togglegaps"
          "${mod}+shift, g, incgaps, 1"
          "${mod}+alt, g, incgaps, -1"

          # movewin
          "${mod}+ctrl+shift, h, movewin, -50, +0"
          "${mod}+ctrl+shift, l, movewin, +50, +0"
          "${mod}+ctrl+shift, k, movewin, +0, -50"
          "${mod}+ctrl+shift, j, movewin, +0, +50"

          # resizewin
          "${mod}+ctrl, h, resizewin, -50, +0"
          "${mod}+ctrl, l, resizewin, +50, +0"
          "${mod}+ctrl, k, resizewin, +0, -50"
          "${mod}+ctrl, j, resizewin, +0, +50"
        ];

        bindl = [
          # "none, XF86MonBrightnessUp, spawn, swayosd-client --brightness raise"
          # "none, XF86MonBrightnessDown, spawn, swayosd-client --brightness lower"
          #
          # "none, XF86AudioRaiseVolume, spawn, swayosd-client --output-volume raise"
          # "none, XF86AudioLowerVolume, spawn, swayosd-client --output-volume lower"
          # "none, XF86AudioMute, spawn, swayosd-client --output-volume mute-toggle"
          # "alt, XF86AudioMute, spawn, jonwin-audio-switch"
          # "none, XF86AudioMicMute, spawn, swayosd-client --input-volume mute-toggle"
          #
          # "none, XF86AudioNext, spawn, swayosd-client --playerctl next"
          # "none, XF86AudioPrev, spawn, swayosd-client --playerctl previous"
          # "none, XF86AudioPlay, spawn, swayosd-client --playerctl play-pause"
          # "none, XF86AudioPause, spawn, swayosd-client --playerctl pause"
          # "none, XF86AudioStop, spawn, swayosd-client --playerctl stop"

          "none, XF86MonBrightnessUp, spawn, noctalia msg brightness-up"
          "none, XF86MonBrightnessDown, spawn, noctalia msg brightness-down"

          "none, XF86AudioRaiseVolume, spawn, noctalia msg volume-up"
          "none, XF86AudioLowerVolume, spawn, noctalia msg volume-down"
          "none, XF86AudioMute, spawn, noctalia msg volume-mute"
          "none, XF86AudioMicMute, spawn, noctalia msg mic-mute"

          "none, XF86AudioNext, spawn, noctalia msg media next"
          "none, XF86AudioPrev, spawn, noctalia msg media previous"
          "none, XF86AudioPlay, spawn, noctalia msg media toggle"
          "none, XF86AudioPause, spawn, noctalia msg media pause"
          "none, XF86AudioStop, spawn, noctalia msg media stop"
        ];

        # Mouse Button Bindings
        # btn_left and btn_right can't bind none mod key
        mousebind = [
          "${mod}, btn_left, moveresize, curmove"
          "${mod}, btn_right, moveresize, curresize"
        ];

        # Axis Bindings
        axisbind = [
          "${mod}, UP, viewtoleft_have_client"
          "${mod}, DOWN, viewtoright_have_client"
        ];
      };
  };
}
