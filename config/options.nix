{ lib, ... }:
let
  inherit (lib) literalExpression mkOption types;
in
{
  options.jonwin = with types; {
    hasBattery = mkOption {
      type = bool;
      default = false;
      description = "Whether this machine has a battery.";
    };

    waybar.output = mkOption {
      type = nullOr (either str (listOf str));
      default = null;
      example = literalExpression ''
        [ "DP-1" "!DP-2" "!DP-3" ]
      '';
      description = ''
        Specifies on which screen this bar will be displayed.
        Exclamation mark(!) can be used to exclude specific output.
      '';
    };
  };
}
