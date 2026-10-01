{ self, ... }: {
  flake.nixosModules.mangoProfile = { pkgs, ... }: {
    imports = with self.nixosModules; [
      desktopProfile

      mango
      noctalia
      style
    ];

    services.displayManager = {
      sessionPackages = [ pkgs.mango ];
      defaultSession = "mango";
    };
  };
}
