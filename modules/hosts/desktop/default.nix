{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        desktopConfiguration
        desktopHardware

        mangoProfile

        # android
        foldingathome
        luks-fido2
        mangohud
        nvidiaDrivers
        steam
        yubikey
      ];
    };
  };
}
