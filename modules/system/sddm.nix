{
  flake.nixosModules.sddm = { config, ... }: {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };

      autoLogin = {
        enable = false;
        user = config.my.username;
      };
    };
  };
}
