{ user, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.${user} = {
    home = {
      username = user;
      homeDirectory = "/home/${user}";
      stateVersion = "26.05";

      file = {
        ".config/scripts" = {
          source = ../scripts;
          recursive = true;
        };
      };
    };
  };

  services.logind.settings.Login = {
    # don’t shutdown when power button is short-pressed
    HandlePowerKey = "ignore";
    HandleLidSwitch = "ignore";
  };
}
