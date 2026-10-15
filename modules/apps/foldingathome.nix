{ self, ... }: {
  flake.nixosModules.foldingathome = { config, lib, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.foldingathome
    ];

    services.foldingathome = {
      enable = true;
      user = "Jonwin";
      team = 37451;
    };

    users.users.foldingathome = {
      isSystemUser = true;
      group = "foldingathome";
      extraGroups = [
        "video"
        "render"
      ];
    };
    users.groups.foldingathome = { };

    systemd.services.foldingathome.serviceConfig = {
      DynamicUser = lib.mkForce false;
      User = "foldingathome";
      Group = "foldingathome";
    };
  };

  flake.homeModules.foldingathome = { pkgs, ... }: {
    home.packages = with pkgs; [
      fahclient
    ];
  };
}
