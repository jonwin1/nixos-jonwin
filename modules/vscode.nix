{ pkgs, user, ... }:
{
  home-manager.users.${user}.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-toolsai.jupyter
      jnoortheen.nix-ide
      ms-python.python
      llvm-vs-code-extensions.vscode-clangd
      enkia.tokyo-night
    ];
  };
}
