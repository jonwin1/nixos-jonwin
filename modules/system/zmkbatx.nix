{ self, ... }: {
  flake.nixosModules.zmkbatx = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.zmkbatx
    ];
  };

  flake.homeModules.zmkbatx = { pkgs, ... }: {
    home.packages = with pkgs; [
      zmkbatx
    ];

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "sleep 1 && uwsm-app -- zmkbatx"
      ];
    };
  };
}
