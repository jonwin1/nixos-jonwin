{ config, lib, pkgs, user, ... }:

{
    imports = [
        (import ./hardware-configuration.nix)
    ];

    boot = {
        loader = {
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot";
            };
            grub = {
                enable = true;
                devices = ["nodev"];
                efiSupport = true;
                useOSProber = true;
                configurationLimit = 10;
            };
            timeout = 5;
        };
        kernelParams = [
            "reboot=bios"
            # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
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
        # nvidia = {
        #     modesetting.enable = true;
        #
        #     # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        #     # Enable this if you have graphical corruption issues or application crashes after waking
        #     # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
        #     # of just the bare essentials.
        #     powerManagement.enable = true;
        #
        #     # Fine-grained power management. Turns off GPU when not in use.
        #     # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        #     powerManagement.finegrained = true;
        #
        #     # Use the NVidia open source kernel module (not to be confused with the
        #     # independent third-party "nouveau" open source driver).
        #     # Support is limited to the Turing and later architectures. Full list of 
        #     # supported GPUs is at: 
        #     # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
        #     # Only available from driver 515.43.04+
        #     # Currently alpha-quality/buggy, so false is currently the recommended setting.
        #     open = false;
        #
        #     # Enable the Nvidia settings menu,
        #     # accessible via `nvidia-settings`.
        #     nvidiaSettings = true;
        #
        #     # Optionally, you may need to select the appropriate driver version for your specific GPU.
        #     package = config.boot.kernelPackages.nvidiaPackages.stable;
        #
        #     prime = {
        #         offload = {
        #             enable = true;
        #             enableOffloadCmd = true;
        #         };
        #         # Make sure to use the correct Bus ID values for your system!
        #         amdgpuBusId = "PCI:5:0:0";
        #         nvidiaBusId = "PCI:1:0:0";
        #     };
        # };
    };
    boot.extraModprobeConfig = ''
        blacklist nouveau
        options nouveau modeset=0
    '';
    services.udev.extraRules = ''
        # Remove NVIDIA USB xHCI Host Controller devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA USB Type-C UCSI devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA Audio devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA VGA/3D controller devices
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
    '';
    boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
}
