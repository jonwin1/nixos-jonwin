{ config, lib, pkgs, user, ... }:

{
  imports = [
    (import ./hardware-configuration.nix)
    ../../modules/kmonad-module.nix
    ../../modules/kmonad.nix
  ];

  boot.loader = {
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

  environment = {
    systemPackages = with pkgs; [
    ];
  };

  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "${user}";
    };
    xserver = {
      videoDrivers = ["nvidia"];
    };
  };

    systemd.user.services = {
        set-display = {
            script = ''
                ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --off
                ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 3440x1440 --rate 144
            '';
            wantedBy = [ "graphical-session.target" ];
            partOf = [ "graphical-session.target" ];
        };
    };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
