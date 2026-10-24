{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        desktopConfiguration
        desktopHardware

        niriProfile
        niriDesktop

        docker
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
