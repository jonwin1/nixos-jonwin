{ user, ... }:
{
  imports = [
    ../home-packages.nix
    ../modules
    ../modules/batsignal.nix
    ../modules/cross-code.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };
}
