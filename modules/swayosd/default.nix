{user, ...}: {
  home-manager.users.${user} = {config, ...}: let
    colors = config.lib.stylix.colors;
  in {
    services.swayosd = {
      enable = true;
    };

    home.file = {
      ".config/swayosd/config.toml".text = ''
        [server]
        max_volume = 100
      '';

      ".config/swayosd/style.css".text = ''
        window#osd {
          background: #${colors.base00};
          opacity: 0.9;

          border-radius: 4px;
          border: 2px solid #${colors.base0D};

          #container {
            margin: 16px;
          }

          image,
          label {
            color: #${colors.base05};
          }

          progressbar:disabled,
          image:disabled {
            opacity: 0.5;
          }

          progressbar {
            min-height: 6px;
            border-radius: 999px;
            border: none;
            background: transparent;
          }
          trough {
            min-height: inherit;
            border-radius: inherit;
            border: none;
            background: #${colors.base01};
          }
          progress {
            min-height: inherit;
            border-radius: inherit;
            border: none;
            background: #${colors.base02};
          }
        }
      '';
    };
  };
}
