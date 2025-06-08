{ pkgs, user, ... }:
{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  users.users.${user}.extraGroups = [ "libvirtd" ];
}
