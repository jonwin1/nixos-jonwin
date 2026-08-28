{ self, ... }: {
  flake = {
    nixosModules.noctalia = { pkgs, ... }: {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        recommendedServices.enable = true;

        package = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
      };

      environment.systemPackages = with pkgs; [
        glib # For gdbus which is required by Battery Widget plugin
        satty # Screenshot annotation
      ];
    };

    wrappers.noctalia = { wlib, ... }: {
      imports = [ wlib.wrapperModules.noctalia ];
      settings = fromTOML (builtins.readFile ./noctalia.toml);
    };
  };
}
