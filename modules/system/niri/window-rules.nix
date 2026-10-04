{
  flake.homeModules.niri.wayland.windowManager.niri.settings._children = [
    {
      window-rule._children = [
        { geometry-corner-radius = 10; }
        { clip-to-geometry = true; }
        {
          background-effect._children = [
            { blur = true; }
            { xray = false; }
          ];
        }
      ];
    }
    {
      window-rule._children = [
        { exclude._props.title = " - YouTube "; }
        { opacity = 0.95; }
      ];
    }
    {
      window-rule._children = [
        { match._props.is-active = true; }
        { opacity = 1.0; }
      ];
    }
    {
      window-rule._children = [
        { match._props.app-id = "dev.noctalia.Noctalia"; }
        { open-floating = true; }
        { default-column-width.fixed = 1080; }
        { default-window-height.fixed = 920; }
      ];
    }
  ];
}
