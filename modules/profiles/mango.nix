{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      mango
      waybar
    ];

    services.displayManager = {
      defaultSession = "mango";
    };
  };
}
