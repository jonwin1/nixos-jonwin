{ self, ... }: {
  flake.nixosModules.mangoProfile = {
    imports = with self.nixosModules; [
      desktopProfile

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
