{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        laptopConfiguration
        laptopHardware

        nvidiaDrivers
        nvidiaPrime

        # hyprlandProfile
        # laptopHyprland
        # hypridleBacklight
        mangoProfile

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
