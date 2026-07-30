{ self, ... }: {
  flake.nixosModules.docker = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    virtualisation.docker = {
      enable = true;
    };

    users.users.${config.my.username}.extraGroups = [ "docker" ];
  };
}
