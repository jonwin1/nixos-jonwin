{ lib, config, ... }:
{
  options.jonwin = with lib.types; {
    luksPart = lib.mkOption {
      type = nullOr str;
      default = null;
      example = "/dev/disk/by-uuid/abcd1234-5ef6-7g89-0hij-1kl2mno34567";
      description = ''
        The encrypted LUKS partition, or null if not using disk encryption.
        Setting this also enables FIDO2 unlock of the partition.
      '';
    };
  };

  config = lib.mkMerge [
    {
      boot = {
        loader = {
          efi.canTouchEfiVariables = true;
          grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = true;
            timeoutStyle = "hidden";
          };
          timeout = 1;
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

    (lib.mkIf (config.jonwin.luksPart != null) {
      boot.initrd = {
        systemd.enable = true;
        luks.devices.encrypted = {
          device = config.jonwin.luksPart;
          crypttabExtraOpts = [ "fido2-device=auto" ];
        };
      };
    })
  ];
}
