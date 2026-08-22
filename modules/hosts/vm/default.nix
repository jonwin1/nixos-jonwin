{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        vmConfiguration
        vmHardware

        smallProfile
      ];
    };
  };
}
