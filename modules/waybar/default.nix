{user, ...}: {
  imports = [
    ./config.nix
    ./style.nix
  ];

  home-manager.users.${user} = {pkgs, ...}: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    services = {
      udiskie.enable = true;
    };

    home = {
      file = {
        ".config/waybar/scripts" = {
          source = ./scripts;
          recursive = true;
        };
      };

      packages = with pkgs; [
        lm_sensors
      ];
    };
  };
  services.udisks2.enable = true;
}
