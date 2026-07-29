{ user, ... }:
{
  home-manager.users.${user} = {
    home = {
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
