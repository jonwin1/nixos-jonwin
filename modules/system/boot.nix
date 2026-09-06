{
  flake.nixosModules.boot = { pkgs, ... }: {
    boot = {
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          efiSupport = true;
          device = "nodev";
          useOSProber = true;
        };
        timeout = 0;
      };

      # Boot splash screen
      plymouth = {
        enable = true;
        font = "${pkgs.nerd-fonts.fira-code}/share/fonts/truetype/NerdFonts/FiraCode/FiraCodeNerdFont-Regular.ttf";
        logo = pkgs.fetchurl {
          url = "https://jonwin.se/jonwin-digitag.png";
          sha256 = "fwQTv4zO9TdtNj1SRltRAUzzNKEsHCLUrFd8OgGRwHI=";
        };
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
