{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      # desktopProfile
      # temporary
      smallProfile

      ghostty
      mango
      rofi
      sddm
      waybar
    ];

    services.displayManager = {
      defaultSession = "mango";
    };
  };
}
