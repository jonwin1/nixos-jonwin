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

      # hardware.new-lg4ff.enable = true;
    };

    homeModules.desktopHome =
      { pkgs, ... }:
      let
        citrix-workspace = pkgs.citrix-workspace.overrideAttrs (old: {
          version = "26.08.0.225";

          src = pkgs.requireFile {
            name = "linuxx64-26.08.0.225.tar.gz";
            sha256 = "185sbj67b12iz2s49g0q1ixby79r8c2xflsvl2fghmh6ap1d8ca2";

            message = ''
              Download the Citrix Workspace 26.08.0.225
              Linux x86_64 archive and run:

              nix-prefetch-url file:///path/to/linuxx64-26.08.0.225.tar.gz
            '';
          };
        });
      in
      {
        home.packages = with pkgs; [
          cura-appimage
          freecad-wayland
          openscad
          # oversteer
          proton-vpn

          citrix-workspace
        ];
      };
  };
}
