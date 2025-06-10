{ user, pkgs, ... }:
{
  programs.adb.enable = true;
  users.users.${user}.extraGroups = [ "adbusers" ];

  home-manager.users.${user}.home.packages = with pkgs; [
    android-studio
  ];
}
