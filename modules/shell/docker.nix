{
  flake.nixosModules.docker = { config, ... }: {
    virtualisation.docker = {
      enable = true;
    };

    users.users.${config.my.username}.extraGroups = [ "docker" ];
  };
}
