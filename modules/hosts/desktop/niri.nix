{ self, ... }: {
  flake = {
    nixosModules.niriDesktop = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.niriDesktop
      ];
    };

    homeModules.niriDesktop = {
      wayland.windowManager.niri.settings = { };
    };
  };
}
