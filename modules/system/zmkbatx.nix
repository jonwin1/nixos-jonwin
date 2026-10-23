{ self, ... }: {
  flake.nixosModules.zmkbatx = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.zmkbatx
    ];
  };

  flake.homeModules.zmkbatx = { pkgs, ... }: {
    home.packages = with pkgs; [
      zmkbatx
    ];
  };
}
