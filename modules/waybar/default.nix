{ user, ... }:
{
  imports = [
    ./config.nix
    ./style.nix
  ];

  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    services = {
      blueman-applet.enable = true;
      network-manager-applet.enable = true;
      udiskie.enable = true;
    };
  };
  services.udisks2.enable = true;
}
