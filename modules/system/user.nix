{
  flake.nixosModules.user = { lib, config, ... }: {
    options.my.username = lib.mkOption {
      type = lib.types.str;
    };

    config = {
      users.users.${config.my.username} = {
        isNormalUser = true;
        extraGroups = [
          "video"
          "wheel"
        ];
      };
    };
  };
}
