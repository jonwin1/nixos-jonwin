{ lib, config, ... }:
{
  options.jonwin.fde = with lib.types; {
    bootPart = lib.mkOption {
      type = str;
      example = "/dev/nvme0n1p1";
      description = "The system boot partition";
    };

    luksPart = lib.mkOption {
      type = str;
      example = "/dev/nvme0n1p2";
      description = "The LUKS partition";
    };
  };

  config.boot = {
    initrd = {
      # Minimal list of modules to use the EFI system partition and the YubiKey
      kernelModules = [
        "vfat"
        "nls_cp437"
        "nls_iso8859-1"
        "usbhid"
      ];

      luks = {
        yubikeySupport = true;

        devices = {
          "encrypted" = {
            device = config.jonwin.fde.luksPart;

            yubikey = {
              slot = 2;
              twoFactor = false;
              gracePeriod = 30; # Time in seconds to wait for YubiKey to be inserted.
              keyLength = 64; # Set to $KEY_LENGTH/8
              saltLength = 16; # Set to $SALT_LENGTH
              storage = {
                device = config.jonwin.fde.bootPart;
              };
            };
          };
        };
      };
    };
  };
}
