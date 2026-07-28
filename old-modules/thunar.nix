{ pkgs, user, ... }:
{
  programs = {
    thunar = {
      enable = true;

      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

  home-manager.users.${user} = {
    home.packages = with pkgs; [
      file-roller
    ];
  };
}
