{ self, ... }: {
  flake.nixosModules.scripts = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.scripts
    ];
  };

  flake.homeModules.scripts = { pkgs, ... }: {
    home.packages = with pkgs; [
      grim
      slurp
      satty
      hyprpicker
      (writeScriptBin "jonwin-cmd-screenshot" (builtins.readFile ./jonwin-cmd-screenshot.sh))
      (writeScriptBin "jonwin-audio-switch" (builtins.readFile ./jonwin-audio-switch.sh))
      (writeScriptBin "jonwin-battery-status" (builtins.readFile ./jonwin-battery-status.sh))

      jq
      (writeScriptBin "jonwin-launch-or-focus" (builtins.readFile ./jonwin-launch-or-focus.sh))
      (writeScriptBin "jonwin-launch-or-focus-tui" (builtins.readFile ./jonwin-launch-or-focus-tui.sh))
      (writeScriptBin "jonwin-launch-or-focus-webapp" (
        builtins.readFile ./jonwin-launch-or-focus-webapp.sh
      ))
      (writeScriptBin "jonwin-launch-tui" (builtins.readFile ./jonwin-launch-tui.sh))
      (writeScriptBin "jonwin-launch-webapp" (builtins.readFile ./jonwin-launch-webapp.sh))

      (writeScriptBin "jonwin-toggle-idle-inhibitor" (
        builtins.readFile ./jonwin-toggle-idle-inhibitor.sh
      ))
      (writeScriptBin "jonwin-toggle-nightlight" (builtins.readFile ./jonwin-toggle-nightlight.sh))

      (writeScriptBin "jonwin-wiki" (builtins.readFile ./jonwin-wiki.sh))
    ];
  };
}
