{ self, ... }: {
  flake.nixosModules.vscodium = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.vscodium
    ];
  };

  flake.homeModules.vscodium = { pkgs, config, ... }: {
    home-manager.users.${config.my.username}.programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        ms-toolsai.jupyter
        jnoortheen.nix-ide
        ms-python.python
        llvm-vs-code-extensions.vscode-clangd
      ];
    };
  };
}
