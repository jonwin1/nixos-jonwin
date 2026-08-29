{ inputs, ... }: {
  imports = [
    inputs.home-manager.flakeModules.home-manager
    inputs.wrapper-modules.flakeModules.wrappers
  ];

  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];

  perSystem = { pkgs, ... }: {
    formatter = pkgs.nixfmt-tree;
  };
}
