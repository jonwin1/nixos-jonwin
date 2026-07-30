{ self, ... }: {
  flake.nixosModules.lazygit = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.lazygit
    ];
  };

  flake.homeModules.lazygit = {
    programs.lazygit = {
      enable = true;
      settings = {
        gui.nerdFontsVersion = "3";
        git.autoFetch = false;
      };
    };
  };
}
