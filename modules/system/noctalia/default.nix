{
  flake = {
    nixosModules.noctalia = {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        recommendedServices.enable = true;

        # package = pkgs.noctalia;
      };
    };

    # wrappers.noctalia = { wlib, ... }: {
    #   imports = [ wlib.wrapperModules.noctalia-shell ];
    # };
  };
}
