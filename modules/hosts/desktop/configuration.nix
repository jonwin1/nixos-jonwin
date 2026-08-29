{ self, ... }: {
  flake = {
    nixosModules.desktopConfiguration = { config, ... }: {
      my = {
        username = "jonwin";
        hostname = "desktop";
        luksPart = "/dev/disk/by-uuid/cafb7838-4fb3-4c07-8fdb-4dd2aaf3f872";
      };

      home-manager.users.${config.my.username}.imports = [ self.homeModules.desktopHome ];

      # Fix grub and splash screen stretch
      boot.loader.grub.gfxmodeEfi = "3440x1440";

      hardware.new-lg4ff.enable = true;
    };

    homeModules.desktopHome = { pkgs, ... }: {
      home.packages = with pkgs; [
        cura-appimage
        freecad-wayland
        heroic
        openscad
        oversteer
        proton-vpn
      ];
    };
  };
}
