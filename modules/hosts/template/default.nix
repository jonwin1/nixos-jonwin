{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.HOSTNAME = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        HOSTNAMEConfiguration
        HOSTNAMEHardware

        # Optionally import one profile from modules/profiles/

        # Modules
      ];
    };
  };
}
