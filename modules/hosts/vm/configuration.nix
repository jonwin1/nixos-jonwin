{
  flake.nixosModules.vmConfiguration = { pkgs, ... }: {
    my.username = "jonwin";
    my.hostname = "nixos";

    environment.systemPackages = with pkgs; [
      nixfmt-tree
      tree
      vim
    ];

    services.openssh.enable = true;
  };
}
