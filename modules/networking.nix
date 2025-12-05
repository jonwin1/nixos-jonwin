{ user, pkgs, hostname, ... }:
{
  networking = {
    hostName = hostname;
    wireless.iwd.enable = true;
  };

  home-manager.users.${user}.home.packages = with pkgs; [
    impala
  ];
}
