{
  flake.homeModules.niri = {
    wayland.windowManager.niri.settings.binds = {
      "Mod+Shift+Plus".show-hotkey-overlay = { };

      # Applications
      "Mod+Q" = {
        close-window = { };
        _props.repeat = false;
      };
      "Mod+X".spawn = [ "ghostty" ];
      "Mod+B".spawn = [ "zen-beta" ];
      "Mod+E".spawn = [ "thunar" ];
      "Mod+U".spawn = [ "yubioath-flutter" ];

      # Misc
      "Mod+O" = {
        toggle-overview = { };
        _props.repeat = false;
      };

      "Mod+T".toggle-column-tabbed-display = { };

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

      # Noctalia
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

      # Focus
      "Mod+H".focus-column-left = { };
      "Mod+J".focus-window-down = { };
      "Mod+K".focus-window-up = { };
      "Mod+L".focus-column-right = { };

      "Mod+Ctrl+H".focus-monitor-left = { };
      "Mod+Ctrl+J".focus-monitor-down = { };
      "Mod+Ctrl+K".focus-monitor-up = { };
      "Mod+Ctrl+L".focus-monitor-right = { };

      "Mod+1".focus-workspace = [ 1 ];
      "Mod+2".focus-workspace = [ 2 ];
      "Mod+3".focus-workspace = [ 3 ];
      "Mod+4".focus-workspace = [ 4 ];
      "Mod+5".focus-workspace = [ 5 ];
      "Mod+6".focus-workspace = [ 6 ];
      "Mod+7".focus-workspace = [ 7 ];
      "Mod+8".focus-workspace = [ 8 ];
      "Mod+9".focus-workspace = [ 9 ];

      # Movement
      "Mod+Shift+H".move-column-left = { };
      "Mod+Shift+J".move-window-down = { };
      "Mod+Shift+K".move-window-up = { };
      "Mod+Shift+L".move-column-right = { };

      "Mod+Shift+Ctrl+H".move-column-to-monitor-left = { };
      "Mod+Shift+Ctrl+J".move-column-to-monitor-down = { };
      "Mod+Shift+Ctrl+K".move-column-to-monitor-up = { };
      "Mod+Shift+Ctrl+L".move-column-to-monitor-right = { };

      "Mod+Alt+H".consume-or-expel-window-left = { };
      "Mod+Alt+J".move-workspace-down = { };
      "Mod+Alt+K".move-workspace-up = { };
      "Mod+Alt+L".consume-or-expel-window-right = { };

      "Mod+Shift+1".move-column-to-workspace = [ 1 ];
      "Mod+Shift+2".move-column-to-workspace = [ 2 ];
      "Mod+Shift+3".move-column-to-workspace = [ 3 ];
      "Mod+Shift+4".move-column-to-workspace = [ 4 ];
      "Mod+Shift+5".move-column-to-workspace = [ 5 ];
      "Mod+Shift+6".move-column-to-workspace = [ 6 ];
      "Mod+Shift+7".move-column-to-workspace = [ 7 ];
      "Mod+Shift+8".move-column-to-workspace = [ 8 ];
      "Mod+Shift+9".move-column-to-workspace = [ 9 ];

      # Size
      "Mod+Ctrl+Alt+H".set-column-width = [ "-5%" ];
      "Mod+Ctrl+Alt+J".set-window-height = [ "+5%" ];
      "Mod+Ctrl+Alt+K".set-window-height = [ "-5%" ];
      "Mod+Ctrl+Alt+L".set-column-width = [ "+5%" ];

      "Mod+S".switch-preset-column-width = { };
      "Mod+Shift+S".switch-preset-column-width-back = { };
      "Mod+Ctrl+S".switch-preset-window-height = { };
      "Mod+Ctrl+Shift+S".switch-preset-window-height-back = { };

      "Mod+M".maximize-column = { };
      "Mod+Shift+M".fullscreen-window = { };
      "Mod+Ctrl+M".expand-column-to-available-width = { };
    };
  };
}
