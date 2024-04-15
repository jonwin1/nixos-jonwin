{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      lua-ls.enable = true;
      nixd.enable = true;
      texlab.enable = true;
      typos-lsp.enable = true;
    };
    keymaps = {
      extra = [
        {
          key = "gd";
          action = "require('telescope.builtin').lps_definitions";
          lua = true;
        }
        {
          key = "gr";
          action = "require('telescope.builtin').lsp_references";
          lua = true;
        }
        {
          key = "gI"; 
					action = "require('telescope.builtin').lsp_implementations";
					lua = true;
        }
        {
          key = "<leader>D"; 
					action = "require('telescope.builtin').lsp_type_definitions";
					lua = true;
        }
        {
          key = "<leader>ds"; 
					action = "require('telescope.builtin').lsp_document_symbols";
					lua = true;
        }
        {
          key = "<leader>ws"; 
					action = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
					lua = true;
        }
      ];
    };
  };
}
