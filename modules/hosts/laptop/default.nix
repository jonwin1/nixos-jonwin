{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        laptopConfiguration
        laptopHardware

        hyprlandProfile
        laptopHyprland
        hypridleBacklight

        android
        battery
        backlight
        luks-fido2
        steam
        yubikey
      ];
    };
  };
}
