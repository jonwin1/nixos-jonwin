{
  pkgs,
  user,
  inputs,
  ...
}: {
  home-manager.users.${user} = {
    imports = [
      inputs.nvf.homeManagerModules.default
    ];

    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          spellcheck = {
            enable = true;
            languages = ["en" "sv"];
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            trouble.enable = true;
          };

          languages = {
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            bash.enable = true;
            clang.enable = true;
            css.enable = true;
            go.enable = true;
            html.enable = true;
            lua.enable = true;
            markdown.enable = true;
            nix.enable = true;
            python.enable = true;
          };

          visuals = {
            fidget-nvim.enable = true;
            highlight-undo.enable = true;
            indent-blankline.enable = true;
            nvim-cursorline.enable = true;
            nvim-web-devicons.enable = true;
          };

          statusline.lualine.enable = true;

          autopairs.nvim-autopairs.enable = true;

          autocomplete.nvim-cmp.enable = true;

          snippets.luasnip.enable = true;

          treesitter = {
            enable = true;
            context.enable = true;
          };

          binds = {
            cheatsheet.enable = true;
            hardtime-nvim.enable = true;
            whichKey.enable = true;
          };

          telescope.enable = true;

          git = {
            enable = true;
            gitsigns.enable = true;
            # gitsigns.codeActions.enable = false;
          };

          dashboard.alpha.enable = true;

          notify.nvim-notify.enable = true;

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

          notes = {
            todo-comments.enable = true;
          };

          terminal = {
            toggleterm = {
              enable = true;
              lazygit.enable = true;
            };
          };

          ui = {
            borders.enable = true;
            colorizer.enable = true;
            illuminate.enable = true;
            noice.enable = true;
            smartcolumn = {
              enable = true;
              setupOpts.colorcolumn = "80";
            };
          };

          comments.comment-nvim.enable = true;
        };
      };
    };

    home = {
      packages = with pkgs; [
        gcc
        clang-tools
        gopls
        hyprls
        jq
        lua-language-server
        nixd
        nixfmt-rfc-style
        pyright
        sqls
        texlab
        typescript-language-server
        typos-lsp
        vscode-langservers-extracted # css
      ];
    };
  };
}
