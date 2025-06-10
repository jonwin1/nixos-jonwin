{ user, ... }:
{
  home-manager.users.${user}.programs.floorp = {
    enable = true;
  };
}
