{
  flake.wrappers.mangowc = {
    settings = {
      bind =
        let
          mod = "ALT"; # "SUPER";
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
          "${mod}+SHIFT, q,            spawn, jwmenu ~/.config/jwmenu/power.toml"
          "NONE,         XF86PowerOff, spawn, jwmenu ~/.config/jwmenu/power.toml"

          # Misc
          "${mod},       p,     toggleglobal"
          "${mod},       f,     togglefloating"
          "${mod},       m,     togglefullscreen"
          "${mod}+SHIFT, m,     togglefakefullscreen"
          "${mod},       Space, spawn, jwmenu ~/.config/jwmenu/system.toml"

          # switch window focus
          "${mod}, Left, focusdir, left"
          "${mod}, Right, focusdir, right"
          "${mod}, Up, focusdir, up"
          "${mod}, Down, focusdir, down"

          # swap window
          "${mod}+SHIFT, Up, exchange_client, up"
          "${mod}+SHIFT, Down, exchange_client, down"
          "${mod}+SHIFT, Left, exchange_client, left"
          "${mod}+SHIFT, Right, exchange_client, right"

          # switch window status
          "${mod}, Tab, togglejump, "
          "${mod}, a, togglemaximizescreen, "
          "${mod}, i, minimized, "
          "${mod}, o, toggleoverlay, "
          "${mod}+SHIFT, I, restore_minimized"
          "${mod}, z, toggle_scratchpad"

          # scroller layout
          "${mod}, e, set_proportion, 1.0"
          "${mod}, x, switch_proportion_preset, "
          "${mod}+ctrl+shift, Left, scroller_stack, left"
          "${mod}+ctrl+shift, Right, scroller_stack, right"
          "${mod}+ctrl+shift, Up, scroller_stack, up"
          "${mod}+ctrl+shift, Down, scroller_stack, down"

          #dwindle layout(manual split mode)
          "${mod}+shift, Return, dwindle_toggle_split_direction"

          # switch layout
          "${mod}, n, switch_layout"

          # tag switch
          "${mod}, Left, viewtoleft, 0"
          "CTRL, Left, viewtoleft_have_client, 0"
          "${mod}, Right, viewtoright, 0"
          "CTRL, Right, viewtoright_have_client, 0"
          "CTRL+${mod}, Left, tagtoleft, 0"
          "CTRL+${mod}, Right, tagtoright, 0"

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
          "${mod}, 1, tag, 1, 0"
          "${mod}, 2, tag, 2, 0"
          "${mod}, 3, tag, 3, 0"
          "${mod}, 4, tag, 4, 0"
          "${mod}, 5, tag, 5, 0"
          "${mod}, 6, tag, 6, 0"
          "${mod}, 7, tag, 7, 0"
          "${mod}, 8, tag, 8, 0"
          "${mod}, 9, tag, 9, 0"

          # monitor switch
          "${mod}+shift, Left, focusmon, left"
          "${mod}+shift, Right, focusmon, right"
          "${mod}+Alt, Left, tagmon, left"
          "${mod}+Alt, Right, tagmon, right"

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
        "SUPER,btn_left,moveresize,curmove"
        "NONE,btn_middle,togglemaximizescreen,0"
        "SUPER,btn_right,moveresize,curresize"
      ];

      # Axis Bindings
      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
      ];
    };
  };
}

#       bind = [
#         # Switch to workspace
#         "${mod}, 1, workspace, 1"
#         "${mod}, 2, workspace, 2"
#         "${mod}, 3, workspace, 3"
#         "${mod}, 4, workspace, 4"
#         "${mod}, 5, workspace, 5"
#         "${mod}, 6, workspace, 6"
#         "${mod}, 7, workspace, 7"
#         "${mod}, 8, workspace, 8"
#         "${mod}, 9, workspace, 9"
#         "${mod}, 0, workspace, 10"
#
#         # Bring workspace to current monitor
#         "${mod} CTRL, 1, focusworkspaceoncurrentmonitor, 1"
#         "${mod} CTRL, 2, focusworkspaceoncurrentmonitor, 2"
#         "${mod} CTRL, 3, focusworkspaceoncurrentmonitor, 3"
#         "${mod} CTRL, 4, focusworkspaceoncurrentmonitor, 4"
#         "${mod} CTRL, 5, focusworkspaceoncurrentmonitor, 5"
#         "${mod} CTRL, 6, focusworkspaceoncurrentmonitor, 6"
#         "${mod} CTRL, 7, focusworkspaceoncurrentmonitor, 7"
#         "${mod} CTRL, 8, focusworkspaceoncurrentmonitor, 8"
#         "${mod} CTRL, 9, focusworkspaceoncurrentmonitor, 9"
#         "${mod} CTRL, 0, focusworkspaceoncurrentmonitor, 10"
#
#         # Move active window to workspace
#         "${mod} SHIFT, 1, movetoworkspace, 1"
#         "${mod} SHIFT, 2, movetoworkspace, 2"
#         "${mod} SHIFT, 3, movetoworkspace, 3"
#         "${mod} SHIFT, 4, movetoworkspace, 4"
#         "${mod} SHIFT, 5, movetoworkspace, 5"
#         "${mod} SHIFT, 6, movetoworkspace, 6"
#         "${mod} SHIFT, 7, movetoworkspace, 7"
#         "${mod} SHIFT, 8, movetoworkspace, 8"
#         "${mod} SHIFT, 9, movetoworkspace, 9"
#         "${mod} SHIFT, 0, movetoworkspace, 10"
#
#         # Move focus
#         "${mod}, H, movefocus, l"
#         "${mod}, L, movefocus, r"
#         "${mod}, K, movefocus, u"
#         "${mod}, J, movefocus, d"
#
#         # Move active window
#         "${mod} SHIFT, H, movewindow, l"
#         "${mod} SHIFT, L, movewindow, r"
#         "${mod} SHIFT, K, movewindow, u"
#         "${mod} SHIFT, J, movewindow, d"
#
#         # Webapps
#         "${mod}, C, exec, jonwin-launch-webapp https://chatgpt.com/"
#
#         # Special Workspaces (see workspace rules)
#         "${mod}, D, togglespecialworkspace, discord"
#         "${mod}, W, togglespecialworkspace, wiki"
#         "${mod}, Y, togglespecialworkspace, music"
#
#         "${mod}, T, togglespecialworkspace, scratchpad"
#         "${mod} SHIFT, T, movetoworkspace, special:scratchpad"
#
#
#         # Screenshot
#         ", Print, exec, jonwin-cmd-screenshot fullscreen save"
#         "SHIFT, Print, exec, jonwin-cmd-screenshot smart slurp"
#
#         # Groups
#         "${mod}, G, togglegroup"
#         "${mod} ALT, G, moveoutofgroup"
#
#         "${mod} ALT, H, moveintogroup, l"
#         "${mod} ALT, L, moveintogroup, r"
#         "${mod} ALT, K, moveintogroup, u"
#         "${mod} ALT, J, moveintogroup, d"
#
#         "${mod} ALT, TAB, changegroupactive, f"
#         "${mod} ALT SHIFT, TAB, changegroupactive, b"
#
#         "${mod} ALT, 1, changegroupactive, 1"
#         "${mod} ALT, 2, changegroupactive, 2"
#         "${mod} ALT, 3, changegroupactive, 3"
#         "${mod} ALT, 4, changegroupactive, 4"
#         "${mod} ALT, 5, changegroupactive, 5"
#         "${mod} ALT, 6, changegroupactive, 6"
#         "${mod} ALT, 7, changegroupactive, 7"
#         "${mod} ALT, 8, changegroupactive, 8"
#         "${mod} ALT, 9, changegroupactive, 9"
#         "${mod} ALT, 0, changegroupactive, 10"
#       ];
#
#       binde = [
#         # Resize active window
#         "${mod} CTRL, H, resizeactive, -50 0"
#         "${mod} CTRL, L, resizeactive, 50 0"
#         "${mod} CTRL, K, resizeactive, 0 -50"
#         "${mod} CTRL, J, resizeactive, 0 50"
#       ];
#
#       bindl = [
#         ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
#         ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
#         "ALT, XF86AudioMute, exec, jonwin-audio-switch"
#
#         ", XF86AudioNext, exec, swayosd-client --playerctl next"
#         ", XF86AudioPrev, exec, swayosd-client --playerctl previous"
#         ", XF86AudioPlay, exec, swayosd-client --playerctl play-pause"
#         ", XF86AudioPause, exec, swayosd-client --playerctl pause"
#         ", XF86AudioStop, exec, swayosd-client --playerctl stop"
#       ];
#
#       bindel = [
#         ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
#         ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
#
#         ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
#         ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
#       ];
#
#       bindm = [
#         "${mod}, mouse:272, movewindow"
#         "${mod}, mouse:273, resizewindow"
#       ];
