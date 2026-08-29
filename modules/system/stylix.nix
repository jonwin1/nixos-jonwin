{ self, inputs, ... }: {
  flake.nixosModules.stylix = { pkgs, config, ... }: {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.stylix
    ];

    stylix = {
      enable = true;

      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

      cursor = {
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePine-Linux";
        size = 24;
      };

      fonts = {
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };

        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };

  flake.homeModules.stylix = { pkgs, ... }: {
    stylix.targets = {
      waybar.addCss = false;
      zen-browser.profileNames = [ "default" ];
    };

    gtk = {
      enable = true;

      iconTheme = {
        package = pkgs.nordzy-icon-theme;
        name = "Nordzy-dark";
      };
    };
  };
}
