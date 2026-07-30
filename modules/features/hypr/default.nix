{ self, ... }: {
  flake.nixosModules.hypr = {
    imports = with self.nixosModules; [
      hypridle
      hyprland
      hyprlock
      hyprpaper
      hyprsunset
    ];
  };
}
