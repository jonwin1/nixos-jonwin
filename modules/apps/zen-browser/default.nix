{ self, inputs, ... }: {
  flake.nixosModules.zenBrowser = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.zenBrowser
    ];
  };

  flake.homeModules.zenBrowser = {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
  };
}
