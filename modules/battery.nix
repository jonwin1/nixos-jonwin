{
  lib,
  config,
  user,
  ...
}:
{
  config = lib.mkIf config.jonwin.hasBattery {
    home-manager.users.${user}.services = {
      batsignal = {
        enable = true;
        extraArgs = [ ];
      };
    };
  };
}
