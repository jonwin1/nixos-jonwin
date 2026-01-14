{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nvidiaConfig;
in
{
  options.nvidiaConfig.enable = lib.mkEnableOption "Enable NVIDIA GPU";

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ nvidia-vaapi-driver ];
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
