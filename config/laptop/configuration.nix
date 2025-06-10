{ pkgs, ... }:
{
  boot = {
    kernelParams = [
      "reboot=bios"
    ];
  };

  programs.light.enable = true;

  # Power Management
  # https://youtu.be/pmuubmFcKtg?si=Cy-ORHDQuzSwjIIe
  # https://github.com/TechsupportOnHold/Batterylife/blob/main/laptop.nix
  services = {
    system76-scheduler.settings.cfsProfiles.enable = true;
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
  };
  powerManagement.powertop.enable = true;

  # Graphics
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    };

    nvidia = {
      modesetting.enable = true;
      open = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

}
