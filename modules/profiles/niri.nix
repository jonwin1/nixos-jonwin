{ self, ... }: {
  flake.nixosModules.niriProfile = { pkgs, ... }: {
    imports = with self.nixosModules; [
      desktopProfile

      niri
      noctalia
      style
    ];

    services.displayManager = {
      sessionPackages = [ pkgs.niri ];
      defaultSession = "niri";
    };
  };
}
