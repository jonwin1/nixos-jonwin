{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      mango
      # waybar
      # waybarMango
      noctalia
    ];

    services.displayManager = {
      defaultSession = "mango";
    };
  };
}
