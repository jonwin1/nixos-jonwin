{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        desktopConfiguration
        desktopHardware
        desktopHyprland
        desktop

        android
        foldingathome
        hypr
        luks-fido2
        nvidiaDrivers
        steam
        waybar
        yubikey
        zmkbatx
      ];
    };
  };
}
