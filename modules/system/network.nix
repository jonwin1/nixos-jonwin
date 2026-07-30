{
  flake.nixosModules.network = { lib, config, ... }: {
    options.my.hostname = lib.mkOption {
      type = lib.types.str;
    };

    config = {
      networking = {
        hostName = config.my.hostname;
        networkmanager.enable = true;
      };

      users.users.${config.my.username}.extraGroups = [
        "networkmanager"
      ];
    };
  };
}
