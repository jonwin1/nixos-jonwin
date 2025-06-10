{ pkgs, user, ... }:
{
  home-manager.users.${user} = {
    home = {
      packages = with pkgs; [
        ghostty
      ];

      file.".config/ghostty/config" = {
        source = ./config;
        recursive = true;
      };
    };
  };
}
