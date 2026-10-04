{ self, ... }: {
  flake = {
    nixosModules.niriDesktop = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.niriDesktop
      ];
    };

    homeModules.niriDesktop = {
      wayland.windowManager.niri.settings._children = [
        {
          output = {
            _args = [ "PNP(AOC) U34G2G4R3 0x0000326C" ];
            mode = "3440x1440@144.001";
            position._props = {
              x = 3840;
              y = 720;
            };
            variable-refresh-rate._props.on-demand = true;
            focus-at-startup = { };
          };
        }
        {
          output = {
            _args = [ "Samsung Electric Company QCQ90S 0x01000E00" ];
            mode = "3840x2160@143.857";
            position._props = {
              x = 0;
              y = 0;
            };
            variable-refresh-rate._props.on-demand = true;
          };
        }
      ];
    };
  };
}
