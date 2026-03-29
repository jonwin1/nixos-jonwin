{
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
