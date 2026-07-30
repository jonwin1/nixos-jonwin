{ self, inputs, ... }: {
  flake.nixosModules.small = { config, ... }: {
    imports = with self.nixosModules; [
      core
      git
      lazygit
      myHomeManager
      zsh
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.small
    ];
  };

  flake.homeModules.small = { pkgs, ... }: {
    home.packages = with pkgs; [
      inputs.nvf.packages.${stdenv.hostPlatform.system}.default
    ];
  };
}
