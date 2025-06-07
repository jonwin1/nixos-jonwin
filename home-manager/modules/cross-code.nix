{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (makeDesktopItem {
      name = "CrossCode";
      desktopName = "CrossCode";
      exec = "/run/current-system/sw/bin/steam-run /home/jonwin/.config/itch/apps/crosscode/CrossCode";
    })
  ];
}
