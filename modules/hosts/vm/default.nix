{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        vmConfiguration
        vmHardware

        myHomeManager

        core
        git
        lazygit
        zsh
      ];
    };
  };
}
