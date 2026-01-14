{ lib, ... }:
{
  options.jonwin.waybar.output = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Waybar outputs where the bar should appear.";
  };
}
