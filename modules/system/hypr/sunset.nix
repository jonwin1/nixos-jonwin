{ self, ... }: {
  flake.nixosModules.hyprsunset = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.hyprsunset
    ];
  };

  flake.homeModules.hyprsunset = {
    services.hyprsunset = {
      enable = true;

      settings = {
        profile = [
          {
            time = "7:30";
            identity = true;
          }
          {
            time = "21:00";
            temperature = 5000;
            gamma = 0.8;
          }
        ];
      };
    };
  };
}
