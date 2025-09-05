{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neowiki-nvim = {
      url = "github:echaya/neowiki.nvim";
      flake = false;
    };

    pomodoro = {
      url = "github:jonwin1/go-pomodoro";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    hosts = [
      {
        user = "jonwin";
        hostname = "desktop";
        system = "x86_64-linux";
      }
      {
        user = "jonwin";
        hostname = "laptop";
        system = "x86_64-linux";
      }
    ];

    # Helper function to create a NixOS configuration.
    makeSystem = {
      user,
      hostname,
      system,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit user hostname inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit user hostname inputs;};
          }

          inputs.stylix.nixosModules.stylix

          ./config/common/configuration.nix
          ./config/common/modules.nix
          ./config/common/packages.nix
          ./config/${hostname}/configuration.nix
          ./config/${hostname}/hardware-configuration.nix
          ./config/${hostname}/modules.nix
          ./config/${hostname}/packages.nix
        ];
      };
  in {
    # Create a set of NixOS configurations, one per host.
    nixosConfigurations =
      nixpkgs.lib.foldl' (
        configs: host:
          configs
          // {
            "${host.hostname}" = makeSystem {inherit (host) user hostname system;};
          }
      ) {}
      hosts;
  };
}
