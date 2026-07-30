{
  flake.nixosModules.sddm = { config, ... }: {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };

      autoLogin = {
        enable = true;
        user = config.my.username;
      };

      defaultSession = "hyprland-uwsm";
    };
  };
}
