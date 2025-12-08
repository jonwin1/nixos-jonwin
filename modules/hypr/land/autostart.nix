{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "wl-clip-persist --clipboard both"
      "pidof hyprlock || hyprlock"
      "sleep 1 && uwsm-app -- zmkbatx"
    ];
  };
}
