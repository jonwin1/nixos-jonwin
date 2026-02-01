{ user, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Switch to workspace
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      # Bring workspace to current monitor
      "SUPER CTRL, 1, focusworkspaceoncurrentmonitor, 1"
      "SUPER CTRL, 2, focusworkspaceoncurrentmonitor, 2"
      "SUPER CTRL, 3, focusworkspaceoncurrentmonitor, 3"
      "SUPER CTRL, 4, focusworkspaceoncurrentmonitor, 4"
      "SUPER CTRL, 5, focusworkspaceoncurrentmonitor, 5"
      "SUPER CTRL, 6, focusworkspaceoncurrentmonitor, 6"
      "SUPER CTRL, 7, focusworkspaceoncurrentmonitor, 7"
      "SUPER CTRL, 8, focusworkspaceoncurrentmonitor, 8"
      "SUPER CTRL, 9, focusworkspaceoncurrentmonitor, 9"
      "SUPER CTRL, 0, focusworkspaceoncurrentmonitor, 10"

      # Move active window to workspace
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"

      # Move focus
      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      # Move active window
      "SUPER SHIFT, H, movewindow, l"
      "SUPER SHIFT, L, movewindow, r"
      "SUPER SHIFT, K, movewindow, u"
      "SUPER SHIFT, J, movewindow, d"

      # Applications
      "SUPER, B, exec, uwsm-app -- zen-beta"
      "SUPER, X, exec, uwsm-app -- ghostty"
      "SUPER, N, exec, uwsm-app -- ghostty -e nvim"
      "SUPER, E, exec, uwsm-app -- thunar"
      "SUPER, U, exec, uwsm-app -- yubioath-flutter"

      "SUPER, R, exec, pkill rofi || rofi -show drun -run-command 'uwsm-app -- {cmd}'"
      "SUPER SHIFT, R, exec, pkill rofi || rofi -show run -run-command 'uwsm-app -- {cmd}'"
      "SUPER, V, exec, pkill rofi || cliphist list | rofi -dmenu | cliphist decode | wl-copy"

      # Webapps
      "SUPER, C, exec, jonwin-launch-webapp https://chatgpt.com/"

      # Special Workspaces (see workspace rules)
      "SUPER, D, togglespecialworkspace, discord"
      "SUPER, W, togglespecialworkspace, wiki"
      "SUPER, Y, togglespecialworkspace, music"

      "SUPER, T, togglespecialworkspace, scratchpad"
      "SUPER SHIFT, T, movetoworkspace, special:scratchpad"

      # Misc
      "SUPER, P, pin, active"
      "SUPER, M, fullscreen, 0"
      "SUPER ALT, M, fullscreen, 1"
      "SUPER SHIFT, M, fullscreenstate, 0 2"
      "SUPER, Q, killactive"
      "SUPER SHIFT, Q, exec, jwmenu ~/.config/jwmenu/power.toml"
      ", XF86PowerOff, exec, jwmenu ~/.config/jwmenu/power.toml"
      "SUPER, SPACE, exec, jwmenu ~/.config/jwmenu/system.toml"
      "SUPER, S, togglesplit,"
      "SUPER, F, togglefloating, active"

      # Screenshot
      ", Print, exec, jonwin-cmd-screenshot fullscreen save"
      "SHIFT, Print, exec, jonwin-cmd-screenshot smart slurp"

      # Groups
      "SUPER, G, togglegroup"
      "SUPER ALT, G, moveoutofgroup"

      "SUPER ALT, H, moveintogroup, l"
      "SUPER ALT, L, moveintogroup, r"
      "SUPER ALT, K, moveintogroup, u"
      "SUPER ALT, J, moveintogroup, d"

      "SUPER ALT, TAB, changegroupactive, f"
      "SUPER ALT SHIFT, TAB, changegroupactive, b"

      "SUPER ALT, 1, changegroupactive, 1"
      "SUPER ALT, 2, changegroupactive, 2"
      "SUPER ALT, 3, changegroupactive, 3"
      "SUPER ALT, 4, changegroupactive, 4"
      "SUPER ALT, 5, changegroupactive, 5"
      "SUPER ALT, 6, changegroupactive, 6"
      "SUPER ALT, 7, changegroupactive, 7"
      "SUPER ALT, 8, changegroupactive, 8"
      "SUPER ALT, 9, changegroupactive, 9"
      "SUPER ALT, 0, changegroupactive, 10"
    ];

    binde = [
      # Resize active window
      "SUPER CTRL, H, resizeactive, -50 0"
      "SUPER CTRL, L, resizeactive, 50 0"
      "SUPER CTRL, K, resizeactive, 0 -50"
      "SUPER CTRL, J, resizeactive, 0 50"
    ];

    bindl = [
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      "ALT, XF86AudioMute, exec, ~/.config/scripts/cmd-audio-switch"

      ", XF86AudioNext, exec, swayosd-client --playerctl next"
      ", XF86AudioPrev, exec, swayosd-client --playerctl previous"
      ", XF86AudioPlay, exec, swayosd-client --playerctl play-pause"
      ", XF86AudioPause, exec, swayosd-client --playerctl pause"
      ", XF86AudioStop, exec, swayosd-client --playerctl stop"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"

      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
