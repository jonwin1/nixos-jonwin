{
  flake.nixosModules.audio = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pavucontrol
    ];

    security.rtkit.enable = true;

    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.enable = true;
      };

      playerctld.enable = true;
    };
  };
}
