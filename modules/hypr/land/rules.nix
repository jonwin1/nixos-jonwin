{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "suppressevent maximize, class:.*"
      "stayfocused, class:(Pinentry)"

      # Remove opacity for some applications
      "opacity 1 override 0.95 override, class:(zen|zen-beta|steam)"
      "opacity 1 override, title:(.*)(- YouTube)(.*)"

      # "Applets"
      "float, title:^(Bluetooth Devices)$"
      "size 600 400, title:^(Bluetooth Devices)$"
      "move 100%-w-5 25, title:^(Bluetooth Devices)$"
      "pin, title:^(Bluetooth Devices)$"

      "float, title:^(Volume Control)$"
      "size 1000 500, title:^(Volume Control)$"
      "move 100%-w-5 25, title:^(Volume Control)$"
      "pin, title:^(Volume Control)$"

      # Jetbrains
      "opacity 1 override, class:^(.*jetbrains.*)$"
      "size 50% 50%, class:(.*jetbrains.*)$, title:^$,floating:1"
      "noinitialfocus, class:^(.*jetbrains.*)$, title:^\\s$"
      "nofocus, class:^(.*jetbrains.*)$, title:^\\s$"
    ];

    layerrule = [
      "blur, waybar"
      "ignorealpha, waybar"
    ];
  };
}
