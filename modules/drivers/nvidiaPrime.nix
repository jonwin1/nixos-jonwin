{
  flake.nixosModules.nvidiaPrime = { lib, config, ... }: {
    options.my = {
      nvidiaBusId = lib.mkOption {
        type = lib.types.str;
        example = "PCI:1@0:0:0";
        description = ''
          See hardware.nvidia.prime.nvidiaBusId.
        '';
      };
      amdgpuBusId = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "PCI:5@0:0:0";
        description = ''
          See hardware.nvidia.prime.amdgpuBusId.
          One of amdgpuBusId and intelBusId must be set if this module is imported.
        '';
      };
      intelBusId = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "PCI:0@0:2:0";
        description = ''
          See hardware.nvidia.prime.intelBusId.
          One of amdgpuBusId and intelBusId must be set if this module is imported.
        '';
      };
    };

    config = {
      services.xserver.videoDrivers = [
        "modesetting"
        "amdgpu"
      ];

      hardware.nvidia = {
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          nvidiaBusId = config.my.nvidiaBusId;
          amdgpuBusId = config.my.amdgpuBusId;
          intelBusId = config.my.intelBusId;
        };
        powerManagement = {
          finegrained = true;
          kernelSuspendNotifier = true;
        };
      };
    };
  };
}
