{ lib, ... }:
{
  programs.nvf.settings.vim = {
    augroups = [ { name = "highlight-yank"; } ];

    autocmds = [
      {
        event = [ "FileType" ];
        pattern = [
          "tex"
          "markdown"
          "md"
        ];
        command = "setlocal textwidth=80 linebreak";
        desc = "Auto break lines in tex and md files.";
      }
      {
        event = [ "TextYankPost" ];
        group = "highlight-yank";
        callback = lib.generators.mkLuaInline ''
          function()
            vim.highlight.on_yank()
          end
        '';
        desc = "Highlight when yanking text.";
      }
    ];
  };
}
