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
          modules = [ ./nixos/${hostname}/configuration.nix ];
        };

      # Helper function to create a Home Manager configuration given a hostname.
      makeHome =
        { hostname }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs user hostname; };
          modules = [ ./home-manager/${hostname}/home.nix ];
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

      # Create a set of Home Manager configurations, one per host.
      homeConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${user}@${host.hostname}" = makeHome { inherit (host) hostname; };
        }
      ) { } hosts;
    };
}
