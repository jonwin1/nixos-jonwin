{ self, inputs, ... }: {
  flake.nixosModules.myHomeManager = { config, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.user
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
        inherit (config) my;
      };

      users.${config.my.username}.imports = [ self.homeModules.myHomeManager ];
    };
  };

  flake.homeModules.myHomeManager = {
    home.stateVersion = "26.05";
  };
}
