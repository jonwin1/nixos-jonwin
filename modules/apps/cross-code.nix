{ self, ... }: {
  flake.nixosModules.crossCode = { config, ... }: {
    imports = [
      self.nixosModules.user
    ];

    home-manager.users.${config.my.username}.imports = [
      self.homeModules.crossCode
    ];
  };

  flake.homeModules.crossCode = { pkgs, ... }: {
    home.packages = with pkgs; [
      (makeDesktopItem {
        name = "CrossCode";
        desktopName = "CrossCode";
        exec = "/run/current-system/sw/bin/steam-run /home/${user}/.config/itch/apps/crosscode/CrossCode";
      })
    ];
  };
}
