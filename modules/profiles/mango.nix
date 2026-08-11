{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      mango
      noctalia
      stylix
    ];

    services.displayManager = {
      defaultSession = "mango";
    };
  };
}
