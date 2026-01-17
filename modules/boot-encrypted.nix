{
  boot = {
    initrd = {
      # Minimal list of modules to use the EFI system partition and the YubiKey
      kernelModules = [ "vfat" "nls_cp437" "nls_iso8859-1" "usbhid" ];

      luks = {
        yubikeySupport = true;

        devices = {
          "encrypted" = {
            device = "/dev/nvme0n1p5";

            yubikey = {
              slot = 2;
              twoFactor = false;
              gracePeriod = 30; # Time in seconds to wait for YubiKey to be inserted.
              keyLength = 64; # Set to $KEY_LENGTH/8
              saltLength = 16; # Set to $SALT_LENGTH
              storage = {
                device = "/dev/nvme0n1p1";
              };
            };
          };
        };
      };
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Boot splash screen
    plymouth.enable = true;
    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
