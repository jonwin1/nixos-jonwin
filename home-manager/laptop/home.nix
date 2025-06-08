{ user, ... }:
{
  imports = [
    ../modules
    ../home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };
}
