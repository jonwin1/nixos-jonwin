{ pkgs, user, ... }:
# FIXME: Don't forget to create an authorization mapping for your user (https://wiki.nixos.org/wiki/Yubikey#pam_u2f)
{
  environment = {
    systemPackages = with pkgs; [
      yubioath-flutter
    ];
  };

  services = {
    # Auto login on first TTY (I exec-once hyprlock in hyprland).
    getty.autologinUser = user;
    getty.autologinOnce = true;

    pcscd.enable = true; # Required by yubioath-flutter.
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  security.pam = {
    u2f = {
      enable = true;
      settings.cue = true;
      control = "sufficient";
    };

    services = {
      hyprlock = {
        u2fAuth = true; # Enable YubiKey login.
        unixAuth = false; # Disable password login.
      };

      login = {
        u2fAuth = true;
        unixAuth = false;
      };

      sudo = {
        u2fAuth = true;
        unixAuth = false;
      };
    };
  };

  # Lock the screen when key is unplugged.
  services.udev.extraRules = ''
    ACTION=="remove",\
     ENV{ID_BUS}=="usb",\
     ENV{ID_MODEL_ID}=="0407",\
     ENV{ID_VENDOR_ID}=="1050",\
     ENV{ID_VENDOR}=="Yubico",\
     RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
