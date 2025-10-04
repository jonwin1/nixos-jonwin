{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      trouble.enable = true;
    };

    spellcheck = {
      enable = true;
      languages = ["en" "sv"];
      programmingWordlist.enable = true;
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
      yaml.enable = true;
    };

    autocomplete.nvim-cmp = {
      enable = true;
      mappings.confirm = null;
      setupOpts.completion.completeopt = "menu,menuone,noselect";
    };
    snippets.luasnip.enable = true;
  };
}
