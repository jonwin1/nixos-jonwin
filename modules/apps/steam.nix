{
  flake.nixosModules.steam = {
    programs = {
      steam = {
        enable = true;
      };

      gamescope = {
        enable = true;
        capSysNice = true;
      };
      gamemode.enable = true;
    };
  };
}
