{ self, ... }: {
  flake = {
    nixosModules.noctalia = { pkgs, config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.noctalia
      ];

      environment.systemPackages = with pkgs; [
        glib # For gdbus which is required by Battery Widget plugin
        satty # Screenshot annotation
      ];
      services.upower.enable = true;
      services.power-profiles-daemon.enable = true;
    };

    homeModules.noctalia = {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = fromTOML (builtins.readFile ./noctalia.toml);
      };
    };
  };
}
