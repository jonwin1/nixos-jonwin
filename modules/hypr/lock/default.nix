{ user, ... }:
{
  home-manager.users.${user} = {
    programs.hyprlock = {
      enable = true;
    };
    home.file = {
      ".config/hypr/hyprlock.conf" = {
        source = ./hyprlock.conf;
      };
      "Pictures/logo.png" = {
        source = ./logo.png;
      };
      ".config/scripts" = {
        source = ./scripts;
        recursive = true;
      };
    };
  };

  security.pam.services.hyprlock = { };
}
