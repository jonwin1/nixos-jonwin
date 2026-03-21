{
  jonwin = {
    bootPart = "/dev/nvme0n1p1";
    luksPart = "/dev/nvme0n1p2";
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
