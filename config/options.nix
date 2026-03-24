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

    backlight = mkOption {
      type = nullOr str;
      default = null;
      description = ''
        Backlight device for controlling screen brightness.
        Use `brightnessctl -l` to list devices.
      '';
    };

    kbdBacklight = mkOption {
      type = nullOr str;
      default = null;
      description = ''
        Keyboard backlight device.
        Use `brightnessctl -l` to list devices.
      '';
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
