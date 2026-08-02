{ self, ... }: {
  flake.nixosModules.hyprlandProfile = {
    imports = with self.nixosModules; [
      desktopProfile

      hypr
      waybar
    ];
  };
}
