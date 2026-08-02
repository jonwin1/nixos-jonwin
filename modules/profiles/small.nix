{ self, inputs, ... }: {
  flake.nixosModules.smallProfile = { config, ... }: {
    imports = with self.nixosModules; [
      coreProfile

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
