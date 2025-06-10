{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pomodoro = {
      url = "github:jonwin1/go-pomodoro";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "jonwin";
      hosts = [
        { hostname = "desktop"; }
        { hostname = "laptop"; }
      ];

      # Helper function to create a NixOS configuration given a hostname.
      makeSystem =
        { hostname }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs user hostname; };
          modules = [
            ./nixos/${hostname}/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs user hostname; };
              home-manager.users.${user} = import ./home-manager/${hostname}/home.nix;
            }
          ];
        };
    in
    {
      # Create a set of NixOS configurations, one per host.
      nixosConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${host.hostname}" = makeSystem { inherit (host) hostname; };
        }
      ) { } hosts;
    };
}
