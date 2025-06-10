{ user, ... }:
{
  home-manager.users.${user}.programs.lazygit = {
    enable = true;
    settings = {
      gui.nerdFontsVersion = "3";
      git.autoFetch = false;
    };
  };
}
