{
  flake.nixosModules.battery = { lib, config, ... }: {
    options.my.powerSaving = lib.mkEnableOption "Laptop power-saving mode";

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
