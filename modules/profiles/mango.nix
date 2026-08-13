{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      mango
      noctalia
      style
    ];

    services.displayManager = {
      defaultSession = "mango";
    };
  };
}
