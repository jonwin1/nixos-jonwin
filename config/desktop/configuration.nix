{
  jonwin.luksPart = "/dev/disk/by-uuid/cafb7838-4fb3-4c07-8fdb-4dd2aaf3f872";

  # Fix grub and splash screen stretch
  boot.loader.grub.gfxmodeEfi = "3440x1440";

  services = {
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      open = true;

      powerManagement = {
        enable = true;
      };
    };
  };
}
