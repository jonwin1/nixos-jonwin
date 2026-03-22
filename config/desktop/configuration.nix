{
  jonwin.fde = {
    bootPart = "/dev/disk/by-uuid/656B-823E";
    luksPart = "/dev/disk/by-uuid/5ab82597-4ada-4acf-a429-5c9132e7ce03";
  };

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
