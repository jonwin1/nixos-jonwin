{
  flake = {
    nixosModules.noctalia = { pkgs, ... }: {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        recommendedServices.enable = true;

        # package = pkgs.noctalia;
      };
      environment.systemPackages = with pkgs; [
        glib # For gdbus which is required by Battery Widget plugin
        satty # Screenshot annotation
      ];
    };

    # wrappers.noctalia = { wlib, ... }: {
    #   imports = [ wlib.wrapperModules.noctalia-shell ];
    # };
  };
}
