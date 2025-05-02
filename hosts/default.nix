{
  lib,
  inputs,
  system,
  home-manager,
  user,
  ...
}:

{
  desktop =
    let
      host = "desktop";
    in
    lib.nixosSystem {
      inherit system;
      specialArgs = { inherit user host inputs; };
      modules = [
        ./desktop
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user host; };
          home-manager.users.${user} = {
            imports = [ (import ./home.nix) ] ++ [ (import ./desktop/home.nix) ];
          };
        }
      ];
    };

  laptop =
    let
      host = "laptop";
    in
    lib.nixosSystem {
      inherit system;
      specialArgs = { inherit user host inputs; };
      modules = [
        ./laptop
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user host; };
          home-manager.users.${user} = {
            imports = [ (import ./home.nix) ] ++ [ (import ./laptop/home.nix) ];
          };
        }
      ];
    };
}
