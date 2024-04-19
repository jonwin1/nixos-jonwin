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

    shadow = false;
    shadowOffsets = [ (-15) (-15) ];
    shadowOpacity = 0.75;
    shadowExclude =[];

    vSync = true;

    settings = {
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
