{
  flake.nixosModules.backlight = { pkgs, lib, ... }: {
    options.my = with lib.types; {
      backlight = lib.mkOption {
        type = str;
        description = ''
          Backlight device for controlling screen brightness.
          Use `brightnessctl -l` to list devices.
        '';
      };

      kbdBacklight = lib.mkOption {
        type = nullOr str;
        default = null;
        description = ''
          Keyboard backlight device.
          Use `brightnessctl -l` to list devices.
        '';
      };
    };

    config = {
      environment.systemPackages = with pkgs; [
        brightnessctl
      ];
    };
  };
}
