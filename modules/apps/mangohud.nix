{ self, ... }: {
  flake.nixosModules.mangohud = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.mangohud
    ];
  };

  flake.wrappers.mangohud =
    {
      wlib,
      pkgs,
      config,
      ...
    }:
    {
      imports = [ wlib.modules.default ];

      package = pkgs.mangohud;

      constructFiles."MangoHud.conf" = {
        relPath = "$XDG_CONFIG_HOME/MangoHud";
        content = ''
          font_size=18

          gpu_stats
          gpu_temp
          cpu_stats
          cpu_temp
          vram
          ram
          battery
          fps
          frametime
          frame_timing
        '';
      };

      env.MANGOHUD_CONFIGFILE = config.constructFiles."MangoHud.conf".path;
    };
}
