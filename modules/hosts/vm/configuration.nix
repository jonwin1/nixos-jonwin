{
  flake = {
    nixosModules.vmConfiguration = {
      my.username = "jonwin";
      my.hostname = "nixos";

      services.openssh.enable = true;
      security.sudo.wheelNeedsPassword = false;

      hardware.graphics.enable = true;
    };
  };
}
