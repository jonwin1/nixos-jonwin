{ stateVersion, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../nixos/modules
  ];

  boot = {
    kernelParams = [
      "reboot=bios"
    ];
  };

  programs.light.enable = true;

  ## https://youtu.be/pmuubmFcKtg?si=Cy-ORHDQuzSwjIIe
  ## https://github.com/TechsupportOnHold/Batterylife/blob/main/laptop.nix
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

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = stateVersion;
}
