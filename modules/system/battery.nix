{
  flake.nixosModules.battery = { lib, config, ... }: {
    options.my = {
      hasBattery = lib.mkOption {
        type = lib.types.bool;
        default = true;
        readOnly = true;
        description = "Whether this machine has a battery.";
      };

      powerSaving = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Laptop power-saving mode";
      };
    };

    config = lib.mkIf config.my.powerSaving {
      powerManagement = {
        enable = true;
        powertop.enable = true;
      };

      services = {
        thermald.enable = true;
        tlp.enable = true;
      };
    };
  };
}
