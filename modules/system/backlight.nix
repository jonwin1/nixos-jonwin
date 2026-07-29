{ self, inputs, ... }: {
  flake.nixosModules.backlight = { pkgs, lib, ... }: {
    options.my = {
      backlight = lib.mkOption {
        type = lib.types.str;
        description = ''
          Backlight device for controlling screen brightness.
          Use `brightnessctl -l` to list devices.
        '';
      };

      kbdBacklight = lib.mkOption {
        type = lib.types.str;
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
