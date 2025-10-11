{pkgs, ...}: {
  programs.nvf.settings.vim = {
    lazy.plugins = {
      "zen-mode.nvim" = {
        package = pkgs.vimPlugins.zen-mode-nvim;

        keys = [
          {
            mode = "n";
            key = "<leader>z";
            action = ''
              function()
                require("zen-mode").toggle({
                  window = {
                    width = 90,
                  },
                  plugins = {
                    options = {
                      laststatus = 0,
                    },
                    gitsigns = { enabled = true },
                  },
                })
              end
            '';
            lua = true;
            desc = "Toggle Zen Mode";
          }
        ];
      };
    };
  };
}
