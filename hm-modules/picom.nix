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
    shadowOffsets = [ (-3) (-3) ];
    shadowOpacity = 0.5;
    shadowExclude =[
      "! name~=''"
      "name = 'Notification'"
      "name = 'Plank'"
      "name = 'Docky'"
      "name = 'Kupfer'"
      "name = 'xfce4-notifyd'"
      "name *= 'VLC'"
      "name *= 'compton'"
      "name *= 'picom'"
      "name *= 'Chromium'"
      "name *= 'Chrome'"
      "class_g = 'Firefox' && argb"
      "class_g = 'Conky'"
      "class_g = 'Kupfer'"
      "class_g = 'Synapse'"
      "class_g ?= 'Notify-osd'"
      "class_g ?= 'Cairo-dock'"
      "class_g ?= 'Xfce4-notifyd'"
      "class_g ?= 'Xfce4-power-manager'"
      "_GTK_FRAME_EXTENTS@:c"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];

    vSync = true;

    settings = {
      shadow-radius = 10;

      glx-no-stencil = true;
      glx-copy-from-font = false;

      blur = {
        background = true;
        method = "dual_kawase";
        strength = 8;
      };

      inactive-opacity-override = false;
      inactive-dim = 0.2;

      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      use-ewmh-active-win = true;
      detect-rounded-corners = true;
      detect-transient = false;
      detect-client-opacity = true;
      detect-client-leader = false;

      xrender-sync-fence = true;
    };
  };
}
