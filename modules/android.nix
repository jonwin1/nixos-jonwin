{
  user,
  pkgs,
  lib,
  ...
}:
{
  programs.adb.enable = true;
  users.users.${user}.extraGroups = [ "adbusers" ];

  home-manager.users.${user}.home.packages = with pkgs; [
    android-studio
  ];

  # Android emulators will not run otherwise.
  environment.sessionVariables = {
    QT_QPA_PLATFORM = lib.mkForce "xcb";
  };
}
