{ self, ... }: {
  flake.nixosModules.foldingathome = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.foldingathome
    ];

    services.foldingathome = {
      enable = false;
      user = "Jonwin";
      team = 37451;
    };
  };

  flake.homeModules.foldingathome = { pkgs, ... }: {
    home.packages = with pkgs; [
      fahclient
    ];
  };
}
