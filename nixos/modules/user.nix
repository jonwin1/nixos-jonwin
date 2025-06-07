{ pkgs, user, ... }:
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "audio"
        "input"
        "libvirtd"
        "networkmanager"
        "uinput"
        "video"
        "wheel"
      ];
    };
  };

  services.getty.autologinUser = user;
}
