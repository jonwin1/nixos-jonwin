{ self, ... }: {
  flake.nixosModules.sddm = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };

      autoLogin = {
        enable = true;
        user = config.my.username;
      };

      defaultSession = "hyprland-uwsm"; # TODO: move to hyprland?
    };
  };
}
