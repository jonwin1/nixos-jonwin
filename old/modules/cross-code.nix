{ pkgs, user, ... }:
{
  home-manager.users.${user}.home.packages = with pkgs; [
    (makeDesktopItem {
      name = "CrossCode";
      desktopName = "CrossCode";
      exec = "/run/current-system/sw/bin/steam-run /home/${user}/.config/itch/apps/crosscode/CrossCode";
    })
  ];
}
