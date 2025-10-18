{pkgs, ...}: {
  boot = {
    kernelParams = [
      "reboot=bios"
    ];
  };

  programs.light.enable = true;

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    thermald.enable = true;
    tlp.enable = true;
  };

  # Create separate boot entry for using the GPU
  specialisation.nvidia.configuration = {
    services.xserver.videoDrivers = ["nvidia"];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [nvidia-vaapi-driver];
      };

      nvidia = {
        open = true;
        modesetting.enable = true;
        powerManagement.enable = true;

        prime = {
          sync.enable = true;
          amdgpuBusId = "PCI:5:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
  };
}
