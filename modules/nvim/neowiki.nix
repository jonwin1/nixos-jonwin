{
  inputs,
  pkgs,
  ...
}: let
  neowiki-source = pkgs.vimUtils.buildVimPlugin {
    name = "neowiki.nvim";
    src = inputs.neowiki-nvim;
  };
in {
  programs.nvf.settings.vim = {
    extraPlugins = {
      neowiki = {
        package = neowiki-source;
        setup = ''
          require("neowiki").setup()
          vim.keymap.set("n", "<leader>ww", require("neowiki").open_wiki, { desc = "Open Wiki" })
          vim.keymap.set("n", "<leader>wW", require("neowiki").open_wiki_floating, { desc = "Open Floating Wiki" })
          vim.keymap.set("n", "<leader>wT", require("neowiki").open_wiki_new_tab, { desc = "Open Wiki in Tab" })
        '';
      };
    };
  };
}
