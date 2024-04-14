{
  programs.nixvim.plugins = {
    luasnip.enable = true;
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;

    cmp = {
      enable = true;

      settings = {
        snippet.expand = "luasnip";
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
        ];

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-l>" = ''
            cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
            end, { "i", "s" })
          '';
          "<C-h>" = ''
            cmp.mapping(function()
              if luasnip-lucally_jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { "i", "s" })
          '';
        };
      };
    };
  };
}
