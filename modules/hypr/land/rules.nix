{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Pinentry stays focused
      "match:class Pinentry, stay_focused on"

      # Remove opacity for some applications
      "match:class (FreeCAD|steam|qemu), opacity 1 override"

      # Floating windows
      "match:tag floating-window, float on"
      "match:tag floating-window, center on"
      "match:tag floating-window, size (monitor_w*0.5) (monitor_h*0.5)"

      "match:class (se.jonwin.nmtui|se.jonwin.bluetui|com.gabm.satty), tag +floating-window"
      "match:title (Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to (open|save).*|[C|c]hoose.*|.*file to save.*), tag +floating-window"
      "match:title Volume Control, tag +floating-window"

      # Fixes FreeCAD drag and drop
      "match:class FreeCAD, no_initial_focus on"

      # ---------- Browsers ----------

      # Browser types
      "tag +chromium-based-browser, match:class ((google-)?[cC]hrom(e|ium).*|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)"
      "tag +firefox-based-browser, match:class ([fF]irefox|zen|zen-beta|librewolf)"

      # Less opacity for browsers
      "opacity 1 override 0.97 override, match:tag chromium-based-browser"
      "opacity 1 override 0.97 override, match:tag firefox-based-browser"

      # No opacity on video sites
      "opacity 1 override, match:title (.* - YouTube .*)"
    ];

    layerrule = [
      "blur on, match:namespace waybar"
      "ignore_alpha 0, match:namespace waybar"
    ];
  };
}
