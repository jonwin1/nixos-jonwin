{ pkgs, ... }:
# https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles/blob/main/nixos/yubikey.nix
{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  programs.ssh.startAgent = true;

  # FIXME: Don't forget to create an authorization mapping file for your user (https://wiki.nixos.org/wiki/Yubikey)
  security.pam.u2f = {
    enable = true;
    settings.cue = true;
    control = "sufficient";
  };

  security.pam.services = {
    hyprlock.u2fAuth = true;
    login.u2fAuth = true;
    sddm.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
  ];
}
