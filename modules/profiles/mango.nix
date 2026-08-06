{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      mango
      waybar
      waybarMango
    ];

    services.displayManager = {
      defaultSession = "mango";
    };
  };
}
