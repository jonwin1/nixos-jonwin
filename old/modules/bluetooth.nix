{
  user,
  pkgs,
  ...
}:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  home-manager.users.${user}.home.packages = with pkgs; [
    bluetui
  ];
}
