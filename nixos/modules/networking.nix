{ user, hostname, ... }:
{
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  users.users.${user}.extraGroups = [
    "networkmanager"
  ];
}
