{ config, lib, pkgs, ...}:

{
  services.picom = {
    enable = true;

    backend = "glx";
    extraArgs = [];

    activeOpacity = 1.0;
    inactiveOpacity = 1.0;
    menuOpacity = 1.0;
    opacityRules = [];

    fade = true;
    fadeDelta = 10;
    fadeSteps = [ 0.028 0.03 ];
    fadeExclude = [];

    shadow = true;
    shadowOffsets = [ (-15) (-15) ];
    shadowOpacity = 0.8;
    shadowExclude =[
      "! name~=''"
      "name = 'Notification'"
      "_GTK_FRAME_EXTENTS@:c"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];

    vSync = true;

    settings = {
      shadow-radius = 25;

      glx-no-stencil = true;
      glx-copy-from-font = false;

      blur = {
        background = true;
        method = "dual_kawase";
        strength = 8;
      };

      inactive-opacity-override = false;
      inactive-dim = 0.2;

      focus-exclude = [
        "! name~=''"
        "name = 'Notification'"
        "class_g = 'st'"
        "_GTK_FRAME_EXTENTS@:c"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];

      mark-wmwin-focused = true;
      mark-ovredir-focused = false;
      use-ewmh-active-win = true;
      detect-rounded-corners = true;
      detect-transient = false;
      detect-client-opacity = true;
      detect-client-leader = false;

      xrender-sync-fence = true;
    };
  };
}
