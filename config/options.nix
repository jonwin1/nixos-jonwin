{ lib, ... }:
{
  options.jonwin = {
    hasBattery = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether this machine has a battery.";
    };

    waybar.output = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Waybar outputs where the bar should appear.";
    };
  };
}
