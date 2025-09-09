{
  user,
  pkgs,
  ...
}: {
  home-manager.users.${user} = {inputs, ...}: {
    imports = [
      inputs.nvf.homeManagerModules.default
      ./options.nix
      ./keymaps.nix
      ./snacks.nix
      ./autocmds.nix
      ./lsp.nix
      ./neowiki.nix
    ];

    home.packages = with pkgs; [
      gcc
    ];

    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          autopairs.nvim-autopairs.enable = true;
          comments.comment-nvim.enable = true;
          statusline.lualine.enable = true;
          telescope.enable = true;

          binds = {
            hardtime-nvim.enable = true;
            whichKey.enable = true;
          };

          git = {
            enable = true;
            git-conflict.enable = true;
            gitsigns.enable = true;
          };

          navigation = {
            harpoon = {
              enable = true;
              mappings = {
                listMarks = "<C-h>";
                file4 = "<C-ö>";
              };
            };
          };

          notes = {
            todo-comments.enable = true;
          };

          terminal = {
            toggleterm = {
              enable = true;
              lazygit.enable = true;
            };
          };

          treesitter = {
            enable = true;
            context.enable = true;
          };

          ui = {
            borders.enable = true;
            colorizer.enable = true;

            noice = {
              enable = true;
              setupOpts = {
                messages.view_search = false;
              };
            };

            smartcolumn = {
              enable = true;
              setupOpts = {
                colorcolumn = "80";
                disabled_filetypes = [
                  "snacks_dashboard"
                ];
              };
            };
          };

          utility = {
            oil-nvim.enable = true;
            preview.markdownPreview.enable = true;
            sleuth.enable = true;
            surround.enable = true;
            undotree.enable = true;
          };

          visuals = {
            fidget-nvim.enable = true;
            nvim-cursorline = {
              enable = true;
              setupOpts.cursorword.enable = true;
            };
            nvim-web-devicons.enable = true;
          };
        };
      };
    };
  };
}
