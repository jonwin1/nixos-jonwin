{user, ...}: {
  home-manager.users.${user} = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [
      inputs.nvf.homeManagerModules.default
      ./options.nix
      ./keymaps.nix
      ./autocmds.nix
      ./lsp.nix
    ];

    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          autocomplete.nvim-cmp.enable = true;
          autopairs.nvim-autopairs.enable = true;

          binds = {
            hardtime-nvim.enable = true;
            whichKey.enable = true;
          };

          comments.comment-nvim.enable = true;
          dashboard.dashboard-nvim.enable = true;

          git = {
            enable = true;
            gitsigns.enable = true;
          };

          navigation = {
            harpoon = {
              enable = true;
              mappings.file4 = "<C-ö>";
            };
          };

          notes = {
            todo-comments.enable = true;
          };

          notify.nvim-notify.enable = true;
          snippets.luasnip.enable = true;
          statusline.lualine.enable = true;
          telescope.enable = true;

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
            noice.enable = true;
            smartcolumn = {
              enable = true;
              setupOpts.colorcolumn = "80";
            };
          };

          utility = {
            images = {
              img-clip.enable = true;
            };

            oil-nvim.enable = true;
            preview.markdownPreview.enable = true;
            sleuth.enable = true;
            surround.enable = true;
            undotree.enable = true;
          };

          visuals = {
            fidget-nvim.enable = true;
            highlight-undo.enable = true;
            indent-blankline.enable = true;
            nvim-cursorline.enable = true;
            nvim-web-devicons.enable = true;
          };
        };
      };
    };
  };
}
