{
  config,
  lib,
  ...
}:
let
  cfg = config.batteryMode;
in
{
  options.batteryMode.enable = lib.mkEnableOption "Laptop power-saving mode";

  config = lib.mkIf cfg.enable {
    powerManagement = {
      enable = true;
      powertop.enable = true;
    };

    services = {
      thermald.enable = true;
      tlp.enable = true;
    };
  };
}
