{ pkgs, user, ... }:
# https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles/blob/main/nixos/yubikey.nix
# FIXME: Don't forget to create an authorization mapping file for your user (https://wiki.nixos.org/wiki/Yubikey)
{
  services = {
    getty.autologinUser = user;
    getty.autologinOnce = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  programs = {
    ssh.startAgent = true;
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
  ];

  security = {
    pam = {
      u2f = {
        enable = true;
        settings.cue = true;
        control = "sufficient";
      };
      services = {
        hyprlock.u2fAuth = true;
        login.u2fAuth = true;
        sudo.u2fAuth = true;
      };
    };
  };

  # Lock the screen when key is unplugged
  services.udev.extraRules = ''
    ACTION=="remove",\
     ENV{ID_BUS}=="usb",\
     ENV{ID_MODEL_ID}=="0407",\
     ENV{ID_VENDOR_ID}=="1050",\
     ENV{ID_VENDOR}=="Yubico",\
     RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
