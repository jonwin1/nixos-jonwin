{ user, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.${user} = {
    home = {
      username = user;
      homeDirectory = "/home/${user}";
      stateVersion = "23.11";
    };
  };
}
