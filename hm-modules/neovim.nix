{ pkgs, ... }:
{
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
      lua-language-server
      nixd
      nixfmt-rfc-style
      pyright
      sqls
      texlab
      typos-lsp
    ];

    file = {
      ".config/nvim" = {
        source = ../dotconfig/nvim;
        recursive = true;
      };
    };
  };
}
