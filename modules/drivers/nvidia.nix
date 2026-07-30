{
  flake.nixosModules.nvidiaDrivers = { pkgs, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      };

      nvidia = {
        open = true;
        modesetting.enable = true;
        powerManagement.enable = true;
      };
    };
  };
}
