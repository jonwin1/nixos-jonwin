{ self, ... }: {
  flake.nixosModules.coreProfile = { pkgs, ... }: {
    imports = with self.nixosModules; [
      boot
      gc
      locale
      network
      user
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    environment.systemPackages = with pkgs; [
      bc
      curl
      fastfetch
      fd
      libnotify
      p7zip
      tree
      unp
      unrar-free
      unzip
      vim
      viu
      wget
      zip
    ];

    system.stateVersion = "26.05";
  };
}
