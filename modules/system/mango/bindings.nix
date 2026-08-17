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

          # Named Scratchpad
          "${mod}, e, toggle_named_scratchpad, thunar, none, thunar"
          "${mod}, d, toggle_named_scratchpad, discord, none, discord"
          "${mod}, y, toggle_named_scratchpad, none, (.*YouTube Music.*), zen-beta --new-window https://music.youtube.com/"
          "${mod}, w, toggle_named_scratchpad, none, wiki, ghostty --working-directory=/home/jonwin/wiki --initial-command=jonwin-wiki --title=wiki"
          "${mod}, u, toggle_named_scratchpad, com.yubico.yubioath, none, yubioath-flutter"

          # Scratchpad
          "${mod}, i, minimized"
          "${mod}+shift, i, restore_minimized, 0"
          "${mod}, z, toggle_scratchpad"

          # Noctalia
          "${mod}, r, spawn, noctalia msg panel-toggle launcher"
          "${mod}, space, spawn, noctalia msg panel-toggle control-center"
          "${mod}, comma, spawn, noctalia msg settings-toggle"
          "${mod}, v, spawn, noctalia msg panel-toggle clipboard"

          # Quit
          "${mod}, q, killclient"
          "${mod}+shift, q, spawn, noctalia msg panel-toggle session"
          "none, XF86PowerOff, spawn, noctalia msg panel-toggle session"

          # Layout
          "${mod}, n, switch_layout"
          "${mod}, s, switch_proportion_preset"
          # "alt+super+ctrl, Left, scroller_stack, left"
          # "alt+super+ctrl, Right, scroller_stack, right"
          # "alt+super+ctrl, Up, scroller_stack, up"
          # "alt+super+ctrl, Down, scroller_stack, down"

          # Gaps
          "${mod}, g, togglegaps"
          "${mod}+shift, g, incgaps, 1"
          "${mod}+ctrl, g, incgaps, -1"

          # Window status
          "${mod}, p, toggleglobal" # Show on all tags
          "${mod}, o, toggleoverlay" # Show on top of windows
          "${mod}, f, togglefloating"
          "${mod}, m, togglemaximizescreen"
          "${mod}+shift, m, togglefullscreen"
          "${mod}+ctrl, m, togglefakefullscreen"
          "${mod}, return, zoom"

          # Focus window
          "${mod}, h, focusdir, left"
          "${mod}, l, focusdir, right"
          "${mod}, k, focusdir, up"
          "${mod}, j, focusdir, down"

          # Move window
          "${mod}+shift, h, exchange_client, left"
          "${mod}+shift, l, exchange_client, right"
          "${mod}+shift, k, exchange_client, up"
          "${mod}+shift, j, exchange_client, down"

          # View tag
          "${mod}, 1, view, 1, 0"
          "${mod}, 2, view, 2, 0"
          "${mod}, 3, view, 3, 0"
          "${mod}, 4, view, 4, 0"
          "${mod}, 5, view, 5, 0"
          "${mod}, 6, view, 6, 0"
          "${mod}, 7, view, 7, 0"
          "${mod}, 8, view, 8, 0"
          "${mod}, 9, view, 9, 0"
          "${mod}, 0, togglejump"
          "${mod}+shift, 0, toggleoverview"

          # Move window to tag
          "${mod}+shift, 1, tag, 1, 0"
          "${mod}+shift, 2, tag, 2, 0"
          "${mod}+shift, 3, tag, 3, 0"
          "${mod}+shift, 4, tag, 4, 0"
          "${mod}+shift, 5, tag, 5, 0"
          "${mod}+shift, 6, tag, 6, 0"
          "${mod}+shift, 7, tag, 7, 0"
          "${mod}+shift, 8, tag, 8, 0"
          "${mod}+shift, 9, tag, 9, 0"

          # Add tag to current view
          "${mod}+ctrl, 1, toggleview, 1"
          "${mod}+ctrl, 2, toggleview, 2"
          "${mod}+ctrl, 3, toggleview, 3"
          "${mod}+ctrl, 4, toggleview, 4"
          "${mod}+ctrl, 5, toggleview, 5"
          "${mod}+ctrl, 6, toggleview, 6"
          "${mod}+ctrl, 7, toggleview, 7"
          "${mod}+ctrl, 8, toggleview, 8"
          "${mod}+ctrl, 9, toggleview, 9"

          # Monitor switch
          "${mod}+alt, h, focusmon, left"
          "${mod}+alt, l, focusmon, right"
          "${mod}+alt+shift, h, tagmon, left"
          "${mod}+alt+shift, l, tagmon, right"

          # Move floating window
          "${mod}+ctrl+shift, h, movewin, -50, +0"
          "${mod}+ctrl+shift, l, movewin, +50, +0"
          "${mod}+ctrl+shift, k, movewin, +0, -50"
          "${mod}+ctrl+shift, j, movewin, +0, +50"

          # Resize window
          "${mod}+ctrl, h, resizewin, -50, +0"
          "${mod}+ctrl, l, resizewin, +50, +0"
          "${mod}+ctrl, k, resizewin, +0, -50"
          "${mod}+ctrl, j, resizewin, +0, +50"

          "${mod}, t, toggle_trackpad_enable"
        ];

        bindl = [
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

        mousebind = [
          "${mod}, btn_left, moveresize, curmove"
          "${mod}, btn_right, moveresize, curresize"
        ];
      };
  };
}
