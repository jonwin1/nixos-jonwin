{
  flake.homeModules.niri.wayland.windowManager.niri.settings.layout = {
    gaps = 5;

    struts = {
      left = 15;
      right = 15;
    };

    always-center-single-column = { };

    default-column-width._children = [ { proportion = 0.75; } ];

    preset-column-widths._children = [
      { proportion = 0.50; }
      { proportion = 0.75; }
      { proportion = 1.00; }
    ];

    border.off = { };
    focus-ring = {
      on = { };
      width = 2;
    };
  };
}
