{
  lib,
  config,
  user,
  ...
}: {
  options.jonwin.hasBattery = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Whether this machine has a battery.";
  };

  config = lib.mkIf config.jonwin.hasBattery {
    home-manager.users.${user}.services = {
      batsignal = {
        enable = true;
        extraArgs = [];
      };
    };
  };
}
