{ self, ... }: {
  flake.nixosModules.nautilus = { pkgs, config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.nautilus
    ];

    environment.systemPackages = with pkgs; [ nautilus ];

    services = {
      gvfs.enable = true;
      udisks2.enable = true;
    };
  };

  flake.homeModules.nautilus = {
    services.udiskie.enable = true;
  };
}
