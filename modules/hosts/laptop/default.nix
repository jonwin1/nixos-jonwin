{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        laptopConfiguration
        laptopHardware

        nvidiaDrivers
        nvidiaPrime

        mangoProfile
        mangoLaptop

        # android
        battery
        backlight
        luks-fido2
        mangohud
        steam
        yubikey
      ];
    };
  };
}
