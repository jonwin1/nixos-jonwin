{
  flake.homeModules.niri.wayland.windowManager.niri.settings.binds = {
    "Mod+Shift+Plus".show-hotkey-overlay = { };

    # ---------- Applications ----------

    "Mod+Q" = {
      close-window = { };
      _props.repeat = false;
    };
    "Mod+X".spawn = [ "ghostty" ];
    "Mod+B".spawn = [ "zen-beta" ];
    "Mod+E".spawn = [ "thunar" ];
    "Mod+U".spawn = [ "yubioath-flutter" ];

    # ---------- Misc ----------

    "Mod+O" = {
      toggle-overview = { };
      _props.repeat = false;
    };

    "Mod+F".toggle-window-floating = { };
    "Mod+Shift+F".switch-focus-between-floating-and-tiling = { };

    "Mod+C".center-column = { };
    "Mod+Shift+C".center-visible-columns = { };

    "Print".screenshot-screen = { };
    "Shift+Print".screenshot = { };

    "Mod+Escape" = {
      toggle-keyboard-shortcuts-inhibit = { };
      _props.allow-inhibiting = false;
    };

    # ---------- Noctalia ----------

    "Mod+R".spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "launcher"
    ];
    "Mod+Space".spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "control-center"
    ];
    "Mod+Comma".spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "control-center"
      "notifications"
    ];
    "Mod+Period".spawn = [
      "noctalia"
      "msg"
      "settings-toggle"
    ];
    "Mod+V".spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "clipboard"
    ];

    "Mod+Shift+q".spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "session"
    ];
    "XF86PowerOff".spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "session"
    ];

    "XF86AudioRaiseVolume" = {
      spawn = [
        "noctalia"
        "msg"
        "volume-up"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      spawn = [
        "noctalia"
        "msg"
        "volume-down"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioMute" = {
      spawn = [
        "noctalia"
        "msg"
        "volume-mute"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioMicMute" = {
      spawn = [
        "noctalia"
        "msg"
        "mic-mute"
      ];
      _props.allow-when-locked = true;
    };

    "XF86AudioNext" = {
      spawn = [
        "noctalia"
        "msg"
        "media"
        "next"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      spawn = [
        "noctalia"
        "msg"
        "media"
        "previous"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioPlay" = {
      spawn = [
        "noctalia"
        "msg"
        "media"
        "toggle"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioPause" = {
      spawn = [
        "noctalia"
        "msg"
        "media"
        "pause"
      ];
      _props.allow-when-locked = true;
    };
    "XF86AudioStop" = {
      spawn = [
        "noctalia"
        "msg"
        "media"
        "stop"
      ];
      _props.allow-when-locked = true;
    };

    "XF86MonBrightnessUp" = {
      spawn = [
        "noctalia"
        "msg"
        "brightness-up"
      ];
      _props.allow-when-locked = true;
    };
    "XF86MonBrightnessDown" = {
      spawn = [
        "noctalia"
        "msg"
        "brightness-down"
      ];
      _props.allow-when-locked = true;
    };

    # ---------- Focus ----------

    # within monitor
    "Mod+H".focus-column-left = { };
    "Mod+J".focus-window-or-workspace-down = { };
    "Mod+K".focus-window-or-workspace-up = { };
    "Mod+L".focus-column-right = { };

    "Mod+N".focus-workspace = [ 99 ];

    # between monitors
    "Mod+Ctrl+H".focus-monitor-left = { };
    "Mod+Ctrl+J".focus-monitor-down = { };
    "Mod+Ctrl+K".focus-monitor-up = { };
    "Mod+Ctrl+L".focus-monitor-right = { };

    # ---------- Move ----------

    # window within monitor
    "Mod+Shift+H".move-column-left = { };
    "Mod+Shift+J".move-window-down-or-to-workspace-down = { };
    "Mod+Shift+K".move-window-up-or-to-workspace-up = { };
    "Mod+Shift+L".move-column-right = { };

    # window between monitors
    "Mod+Shift+Ctrl+H".move-window-to-monitor-left = { };
    "Mod+Shift+Ctrl+J".move-window-to-monitor-down = { };
    "Mod+Shift+Ctrl+K".move-window-to-monitor-up = { };
    "Mod+Shift+Ctrl+L".move-window-to-monitor-right = { };

    # workspace within monitor
    "Mod+Alt+J".move-workspace-down = { };
    "Mod+Alt+K".move-workspace-up = { };

    # workspace between monitors
    "Mod+Alt+Ctrl+H".move-workspace-to-monitor-left = { };
    "Mod+Alt+Ctrl+J".move-workspace-to-monitor-right = { };
    "Mod+Alt+Ctrl+K".move-workspace-to-monitor-down = { };
    "Mod+Alt+Ctrl+L".move-workspace-to-monitor-up = { };

    # ---------- Size ----------

    "Mod+S".switch-preset-column-width = { };
    "Mod+Shift+S".switch-preset-column-width-back = { };

    "Mod+M".maximize-column = { };
    "Mod+Shift+M".fullscreen-window = { };
    "Mod+Ctrl+M".expand-column-to-available-width = { };
    "Mod+Alt+M".toggle-windowed-fullscreen = { };
  };
}
