{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "stayfocused, class:(Pinentry)"

      # Remove opacity for some applications
      "opacity 1 override 0.95 override, class:(zen|zen-beta|steam)"
      "opacity 1 override, title:(.*)(- YouTube)(.*)"

      "float,class:^(se\.jonwin\.floating\..*)$"
      "center,class:^(se\.jonwin\.floating\..*)$"
      "size 1400 800,class:^(se\.jonwin\.floating\..*)$"

      # "Applets"
      "float, title:^(Volume Control)$"
      "size 1000 500, title:^(Volume Control)$"
      "move 100%-w-5 25, title:^(Volume Control)$"
      "pin, title:^(Volume Control)$"

      # Jetbrains
      # https://github.com/hyprwm/Hyprland/issues/1947#issuecomment-2690914693
      "opacity 1 override, class:^(.*jetbrains.*)$"
      "focusonactivate on,class:^(jetbrains-.*)$"
      "dimaround,class:^(jetbrains-.*)$,floating:1,title:^(?!win)"
      "center,class:^(jetbrains-.*)$,floating:1,title:^(?!win)"
      "noanim,class:^(jetbrains-.*)$,title:^(win.*)$"
      "noinitialfocus,class:^(jetbrains-.*)$,title:^(win.*)$"
      "rounding 0,class:^(jetbrains-.*)$,title:^(win.*)$"

      # Fixes FreeCAD drag and drop
      "noinitialfocus, class:FreeCAD"
    ];

    layerrule = [
      "blur, waybar"
      "ignorealpha, waybar"
    ];
  };
}
