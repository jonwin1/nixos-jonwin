{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        self.nixosModules.vmConfiguration
        self.nixosModules.vmHardware

        self.nixosModules.myHomeManager

        self.nixosModules.core
        self.nixosModules.git
        self.nixosModules.lazygit
        self.nixosModules.zsh
      ];
    };
  };
}
