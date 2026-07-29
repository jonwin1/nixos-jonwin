{ self, inputs, ... }: {
  flake = {
    nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        self.nixosModules.vmConfiguration
        self.nixosModules.vmHardware

        self.nixosModules.myHomeManager
        self.nixosModules.vmHome

        self.nixosModules.core
        self.nixosModules.zsh
      ];
    };

    nixosModules.vmHome = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.git
      ];
    };
  };
}
