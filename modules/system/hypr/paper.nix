{ self, ... }: {
  flake.nixosModules.hyprpaper = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.hyprpaper
    ];
  };

  flake.homeModules.hyprpaper = {
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
