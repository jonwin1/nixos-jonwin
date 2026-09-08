{
  flake.nixosModules.plymouth = { pkgs, ... }: {
    boot = {
      # Boot splash screen
      plymouth = {
        enable = true;
        theme = "mytheme";

        themePackages = [
          (pkgs.stdenv.mkDerivation {
            pname = "plymouth-mytheme";
            version = "1.0";

            src = ./mytheme;

            installPhase = ''
              mkdir -p $out/share/plymouth/themes/mytheme
              cp -r ./* $out/share/plymouth/themes/mytheme/
              find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
            '';
          })
        ];
      };

      # Enable "Silent boot"
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];
    };
  };
}
