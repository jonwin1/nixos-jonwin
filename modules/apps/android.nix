{ self, ... }: {
  flake.nixosModules.android = { lib, config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.android
    ];

    users.users.${config.my.username}.extraGroups = [ "adbusers" ];

    # Android emulators will not run otherwise.
    # environment.sessionVariables = {
    #   QT_QPA_PLATFORM = lib.mkForce "xcb";
    # };
  };

  flake.homeModules.android = { pkgs, ... }: {
    home.packages = with pkgs; [
      android-studio
      android-tools
      genymotion
    ];
  };
}
