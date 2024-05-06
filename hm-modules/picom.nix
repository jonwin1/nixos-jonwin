{
  services.picom = {
    enable = true;
    backend = "glx";

    fade = true;
    fadeDelta = 10;
    fadeSteps = [ 0.028 0.03 ];

    vSync = true;

    settings = {
      glx-no-stencil = true;
      glx-copy-from-font = false;

      inactive-opacity-override = false;
      inactive-dim = 0.2;
      focus-exclude = [
        "! name~=''"
        "name = 'Notification'"
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
