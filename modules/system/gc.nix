{
  flake.nixosModules.gc = {
    nix = {
      optimise = {
        automatic = true;
        randomizedDelaySec = "300";
      };

      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };

      extraOptions = ''
        # Free up to 1GiB whenever there is less than 100MiB left.
        min-free = ${toString (100 * 1024 * 1024)}
        max-free = ${toString (1024 * 1024 * 1024)}
      '';
    };
  };
}
