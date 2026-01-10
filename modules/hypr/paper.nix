{ user, ... }:
{
  home-manager.users.${user} = {
    services.hyprpaper = {
      enable = true;

      settings = {
        ipc = true;
        splash = false;

        wallpaper = [
          {
            monitor = "";
            path = "~/Pictures/wallpaper/";
            timeout = 300;
          }
        ];
      };
    };
  };
}
