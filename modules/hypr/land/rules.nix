{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "stayfocused, class:(Pinentry)"

      # Remove opacity for some applications
      "opacity 1 override 0.95 override, class:(zen|zen-beta|steam|chrom.*)"
      "opacity 1 override, title:(.*)(- YouTube)(.*)"

      # Floating windows
      "float, tag:floating-window"
      "center, tag:floating-window"
      "size 1500 1000, tag:floating-window"

      "tag +floating-window, class:(se.jonwin.impala|se.jonwin.bluetui|com.gabm.satty)"
      "tag +floating-window, title:^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*|.*file to save.*)"
      "tag +floating-window, title:^(Volume Control)$"

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
