{ user, ... }:
{
  imports = [
    ../home-packages.nix
    ../modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };
}
