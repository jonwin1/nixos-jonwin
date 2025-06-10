{ pkgs, user, ... }:
{
  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
  };

  services.getty.autologinUser = user;
}
