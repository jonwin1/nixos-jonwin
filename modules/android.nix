{
  user,
  pkgs,
  lib,
  ...
}:
{
  users.users.${user}.extraGroups = [ "adbusers" ];

  home-manager.users.${user} = {
    home.packages = with pkgs; [
      android-studio
      android-tools
    ];

    wayland.windowManager.hyprland.settings.windowrule = [
      "match:class ^(jetbrains-.*)$, opacity 1 override"

      # https://github.com/basecamp/omarchy/blob/53b8fc42572959aa51db0e1cbe23fb4b2170edec/default/hypr/apps/jetbrains.conf
      # Fix splash screen showing in weird places and prevent annoying focus takeovers
      "tag +jetbrains-splash, match:class ^(jetbrains-.*)$, match:title ^(splash)$, match:float 1"
      "center on, match:tag jetbrains-splash"
      "no_focus on, match:tag jetbrains-splash"
      "border_size 0, match:tag jetbrains-splash"

      # Center popups/find windows
      "tag +jetbrains, match:class ^(jetbrains-.*), match:title ^()$, match:float 1"
      "center on, match:tag jetbrains"

      # Enabling this makes it possible to provide input in popup dialogs (search window, new file, etc.)
      "stay_focused on, match:tag jetbrains"
      "border_size 0, match:tag jetbrains"

      # For some reason tag:jetbrains does not work for size rule
      "min_size (monitor_w*0.5) (monitor_h*0.5), match:class ^(jetbrains-.*), match:title ^()$, match:float 1"

      # Disable window flicker when autocomplete or tooltips appear
      "no_initial_focus on, match:class ^(jetbrains-.*)$, match:title ^(win.*)$, match:float 1"

      # Disable mouse focus
      "no_follow_mouse on, match:class ^(jetbrains-.*)$"
    ];
  };

  # Android emulators will not run otherwise.
  environment.sessionVariables = {
    QT_QPA_PLATFORM = lib.mkForce "xcb";
  };
}
