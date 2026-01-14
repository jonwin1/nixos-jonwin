{
  user,
  lib,
  ...
}:
{
  jonwin.hasBattery = true;
  nvidiaConfig.enable = lib.mkDefault false;
  batteryMode.enable = lib.mkDefault true;

  boot = {
    kernelParams = [
      "reboot=bios"
    ];
  };

  programs.light.enable = true;

  specialisation = {
    # Enable the dedicated GPU and increase frame rate
    nvidia.configuration = {
      nvidiaConfig.enable = true;

      home-manager.users.${user} = {
        wayland.windowManager.hyprland.settings.monitor = [
          "eDP-1, 2560x1600@120, 0x0, 1.6"
        ];
      };
    };

    # Enable dedicated GPU, disable power optimizations, and configure docked monitors.
    docked.configuration = {
      nvidiaConfig.enable = true;
      batteryMode.enable = false;

      home-manager.users.${user} = {
        wayland.windowManager.hyprland.settings = {
          cursor = {
            default_monitor = lib.mkForce "desc:AOC U34G2G4R3 0x0000326C";
          };

          monitor = lib.mkForce [
            "eDP-1, disable"
            "desc:AOC U34G2G4R3 0x0000326C, 3440x1440@144, 0x0, 1"
            "desc:Samsung Electric Company QCQ90S 0x01000E00, 3840x2160@120, auto-left, 1"
          ];

          workspace = lib.mkForce [
            "1, monitor:desc:AOC U34G2G4R3 0x0000326C, default:true"
            "10, monitor:desc:Samsung Electric Company QCQ90S 0x01000E00, default:true"
          ];
        };
      };
    };
  };
}
