{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        border_size = 1;
        gaps_in = 0;
        gaps_out = 0;
        "col.inactive_border" = "0xff2e3440";
        "col.active_border" = "0xff81a1c1";
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        dim_inactive = true;
        dim_strength = 0.2;
      };

      input = {
        kb_layout = "se";
        kb_options = [ "caps:escape_shifted_capslock" ];
      };

      monitor = [ ", highres, auto, 1" ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_use_r = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        font_family = "FiraCode Nerd Font";
        vrr = 2;
        # enable_swallow = true;
        # swallow_regex = "^(ghostty)$";
      };

      cursor = {
        inactive_timeout = 2;
        no_hardware_cursors = true;
      };

      dwindle = {
        pseudotile = true;
        force_split = 2;
        preserve_split = true;
        special_scale_factor = 0.6;
      };

      windowrulev2 = [
        "float, title:^(Bluetooth Devices)$"
        "size 600 400, title:^(Bluetooth Devices)$"
        "move 100%-w-5 45, title:^(Bluetooth Devices)$"
        "pin, title:^(Bluetooth Devices)$"
        "noborder on, title:^(Bluetooth Devices)$"

        "float, title:^(Volume Control)$"
        "size 1000 500, title:^(Volume Control)$"
        "move 100%-w-5 45, title:^(Volume Control)$"
        "pin, title:^(Volume Control)$"
        "noborder on, title:^(Volume Control)$"
      ];

      exec-once = [
        "waybar"
        "systemctl --user start hyprpolkitagent"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboard both"
      ];

      "$mod" = "SUPER";

      bind =
        [
          # Applications
          "$mod, B, exec, floorp"
          "$mod SHIFT, B, exec, rofi-rbw"
          "$mod, E, exec, thunar"
          "$mod, R, exec, rofi -show drun"
          "$mod SHIFT, R, exec, rofi -show run"
          "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mod, X, exec, ghostty"

          # Windows & Workspaces
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"

          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, L, movewindow, r"
          "$mod SHIFT, K, movewindow, u"
          "$mod SHIFT, J, movewindow, d"

          "$mod, A, pin, active"
          "$mod, M, fullscreen, 0"
          "$mod SHIFT, M, fullscreenstate, 0 2"
          "$mod, Q, killactive"
          "$mod SHIFT, Q, exec, rofi-power-menu"
          "$mod, S, togglesplit,"
          "$mod SHIFT, S, pseudo,"
          "$mod, SPACE, togglefloating, active"

          # Screenshot
          "$mod, P, exec, grimblast --notify copysave output"
          "$mod SHIFT, P, exec, grimblast --notify copysave area"
          "$mod ALT, P, exec, grimblast --notify copysave active"
          "$mod CTRL, P, exec, grimblast --notify copysave screen"

          # Scratchpad
          "$mod, D, togglespecialworkspace, magic"
          "$mod SHIFT, D, movetoworkspace, special:magic"

          # Groups
          "$mod, G, togglegroup,"
          "$mod, TAB, changegroupactive,"

          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 10
          )
        );

      binde = [
        "$mod CTRL, H, resizeactive, -20 0"
        "$mod CTRL, L, resizeactive, 20 0"
        "$mod CTRL, K, resizeactive, 0 -20"
        "$mod CTRL, J, resizeactive, 0 20"
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
