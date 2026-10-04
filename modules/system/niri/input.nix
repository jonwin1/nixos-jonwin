{
  flake.homeModules.niri.wayland.windowManager.niri.settings.input = {
    keyboard = {
      xkb = {
        layout = "se";
        options = "caps:escape";
      };
      numlock = true;
    };

    warp-mouse-to-focus._props = {
      mode = "center-xy-always";
    };
  };
}
