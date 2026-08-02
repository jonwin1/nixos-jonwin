{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        laptopConfiguration
        laptopHardware
        laptopHyprland
        desktop

        android
        battery
        backlight
        hypridleBacklight
        hypr
        luks-fido2
        steam
        waybar
        yubikey
      ];
    };
  };
}
