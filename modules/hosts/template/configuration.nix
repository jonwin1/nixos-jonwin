{ self, ... }: {
  flake = {
    nixosModules.HOSTNAMEConfiguration = { config, ... }: {
      my = {
        username = "USERNAME";
        hostname = "HOSTNAME";
      };

      home-manager.users.${config.my.username}.imports = [ self.homeModules.HOSTNAMEHome ];
    };

    homeModules.HOSTNAMEHome = { pkgs, ... }: {
      home.packages = with pkgs; [
      ];
    };
  };
}
