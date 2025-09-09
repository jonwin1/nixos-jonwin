{pkgs, ...}: {
  programs.nvf.settings.vim = {
    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        bigfile = {enabled = true;};

        dashboard = {
          enabled = true;
          sections = [
            {section = "header";}
            {
              icon = " ";
              title = "Keymaps";
              section = "keys";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Recent Files";
              section = "recent_files";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              indent = 2;
              padding = 1;
            }
          ];
        };

        gitbrowse = {enabled = true;};
        image = {enabled = true;};
        indent = {
          enabled = true;
          animate.enabled = false;
        };
        zen = {enabled = true;};
      };
    };

    keymaps = [
      {
        key = "<leader>gb";
        mode = "n";
        lua = true;
        action = "function() Snacks.gitbrowse() end";
        desc = "Open git repo in browser";
      }
      {
        key = "<leader>z";
        mode = "n";
        lua = true;
        action = "function() Snacks.zen() end";
        desc = "Toggle zen mode";
      }
    ];
  };

  home.packages = with pkgs; [
    # Snacks.image dependencies
    imagemagick
    ghostscript
  ];
}
