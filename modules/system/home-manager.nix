{ self, inputs, ... }: {
  flake.nixosModules.myHomeManager = { config, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit (config) my;
      };

      users.${config.my.username}.imports = [ self.homeModules.myHomeManager ];
    };
  };

  flake.homeModules.myHomeManager = {
    home.stateVersion = "26.05";
  };
}
