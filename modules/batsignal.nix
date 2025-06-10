{ user, ... }:
{
  home-manager.users.${user}.services = {
    batsignal = {
      enable = true;
      extraArgs = [ ];
    };
  };
}
