{
  flake = {
    nixosModules.noctalia = { pkgs, ... }: {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        recommendedServices.enable = true;

        # package = pkgs.noctalia;
      };
      environment.systemPackages = [
        pkgs.glib # For gdbus which is required by Battery Widget plugin
      ];
    };

    # wrappers.noctalia = { wlib, ... }: {
    #   imports = [ wlib.wrapperModules.noctalia-shell ];
    # };
  };
}
