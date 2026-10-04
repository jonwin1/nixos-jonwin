{
  flake.homeModules.niri.wayland.windowManager.niri.settings._children = [
    {
      layer-rule._children = [
        { match._props.namespace = "^(noctalia-bar-default|noctalia-bar-bottom)$"; }
        {
          background-effect._children = [
            { xray = false; }
            { blur = false; }
          ];
        }
      ];
    }
    {
      layer-rule._children = [
        { match._props.namespace = "^noctalia-backdrop"; }
        { place-within-backdrop = true; }
      ];
    }
  ];
}
