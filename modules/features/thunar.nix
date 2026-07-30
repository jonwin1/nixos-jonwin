{ self, ... }: {
  flake.nixosModules.thunar = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.thunar
    ];

    programs = {
      thunar = {
        enable = true;

        plugins = with pkgs; [
          thunar-archive-plugin
          thunar-volman
        ];
      };
    };

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };

    xdg.mime.defaultApplications = {
      "inode/directory" = "thunar.desktop";
    };
  };

  flake.homeModules.thunar = { pkgs, ... }: {
    home.packages = with pkgs; [
      file-roller
    ];
  };
}
