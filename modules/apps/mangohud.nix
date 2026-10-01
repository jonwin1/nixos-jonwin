{ self, ... }: {
  flake = {
    nixosModules.mangohud = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.mangohud
      ];
    };

    homeModules.mangohud = {
      programs.mangohud = {
        enable = true;

        settings = {
          font_size = 18;

          gpu_stats = true;
          gpu_temp = true;
          cpu_stats = true;
          cpu_temp = true;
          vram = true;
          ram = true;
          battery = true;
          fps = true;
          frametime = true;
          frame_timing = true;
        };
      };
    };
  };
}
