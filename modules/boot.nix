{
  boot = {
    initrd = {
      systemd.enable = true;
      luks.devices."encrypted".crypttabExtraOpts = [ "fido2-device=auto" ];
    };
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
