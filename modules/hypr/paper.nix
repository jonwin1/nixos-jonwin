{ user, ... }:
{
  home-manager.users.${user}.services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/wallpaper.png" ];
      wallpaper = [ ",~/Pictures/wallpaper.png" ];
    };
  };
}
