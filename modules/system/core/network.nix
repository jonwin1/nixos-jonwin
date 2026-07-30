{ self, ... }: {
  flake.nixosModules.network = { lib, config, ... }: {
    imports = [
      self.nixosModules.user
    ];

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
