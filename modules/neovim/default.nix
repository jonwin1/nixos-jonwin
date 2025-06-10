{ pkgs, user, ... }:
{
  home-manager.users.${user} = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      withRuby = true;
      withPython3 = true;
      withNodeJs = true;
    };

    home = {
      packages = with pkgs; [
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

      file = {
        ".config/nvim" = {
          source = ./config;
          recursive = true;
        };
      };
    };
  };
}
