{ self, ... }: {
  flake.nixosModules.scripts = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.scripts
    ];
  };

  flake.homeModules.scripts = { pkgs, ... }: {
    home.packages = with pkgs; [
      jq

      (writeScriptBin "jonwin-battery-status" (builtins.readFile ./jonwin-battery-status.sh))
      # (writeScriptBin "jonwin-audio-switch" (builtins.readFile ./jonwin-audio-switch.sh))

      (writeScriptBin "jonwin-wiki" (builtins.readFile ./jonwin-wiki.sh))

      # Mango
      (writeScriptBin "jonwin-mango-focus-or-launch" (
        builtins.readFile ./mango/jonwin-mango-focus-or-launch.sh
      ))
    ];
  };
}
