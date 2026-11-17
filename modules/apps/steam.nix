{
  flake.nixosModules.steam = { pkgs, ... }: {
    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
      };

      gamescope = {
        enable = true;
        capSysNice = true;
      };
      gamemode.enable = true;
    };

    # https://wiki.nixos.org/wiki/Steam_Frame

    hardware.enableRedistributableFirmware = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom=SE
    '';

    environment.systemPackages = [ pkgs.iw ];
  };
}
