{
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

    outputs = { 
        self,
        nixpkgs,
        home-manager,
        ...
        } @ inputs:
        let
            system = "x86_64-linux";
            user = "jonwin";

            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };

            lib = nixpkgs.lib;
        in 
            {
            nixosConfigurations = (
                import ./hosts {
                    inherit (nixpkgs) lib;
                    inherit inputs user system home-manager;
                }
            );
        };
}
