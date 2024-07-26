{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:jonwin1/nixvim-jonwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        dwm = {
            url = "github:jonwin1/dwm-jonwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        slstatus = {
            url = "github:jonwin1/slstatus-jonwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        st = {
            url = "github:jonwin1/st-jonwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        dmenu = {
            url = "github:jonwin1/dmenu-jonwin";
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
