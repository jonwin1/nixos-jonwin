{ self, inputs, ... }: {
  flake.nixosModules.MODULE = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.OTHERMODULE
    ];

    # NixOS options
  };
}
