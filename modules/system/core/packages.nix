{
  flake.nixosModules.corePackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      bc
      curl
      fastfetch
      fd
      libnotify
      nixfmt-tree
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
  };
}
