{ self, ... }: {
  flake.nixosModules.virtualization = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    programs.virt-manager.enable = true;

    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };

    users.users.${config.my.username}.extraGroups = [ "libvirtd" ];
    networking.firewall.trustedInterfaces = [ "virbr0" ];
  };
}
