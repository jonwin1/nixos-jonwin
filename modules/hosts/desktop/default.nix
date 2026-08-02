{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        desktopConfiguration
        desktopHardware

        desktopHyprland
        hyprlandProfile

        android
        foldingathome
        luks-fido2
        nvidiaDrivers
        steam
        yubikey
        zmkbatx
      ];
    };
  };
}
