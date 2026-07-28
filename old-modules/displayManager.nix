{ user, ... }:
{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };

    autoLogin = {
      enable = true;
      inherit user;
    };

    defaultSession = "hyprland-uwsm";
  };
}
