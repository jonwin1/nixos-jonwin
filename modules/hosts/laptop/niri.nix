{ self, ... }: {
  flake = {
    nixosModules.niriLaptop = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.niriLaptop
      ];
    };

    homeModules.niriLaptop = {
      wayland.windowManager.niri.settings = { };
    };
  };
}
