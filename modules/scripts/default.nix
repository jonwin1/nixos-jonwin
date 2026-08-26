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
      # (writeScriptBin "jonwin-audio-switch" (builtins.readFile ./hypr/jonwin-audio-switch.sh))

      # grim
      # hyprpicker
      # satty
      # slurp
      # (writeScriptBin "jonwin-cmd-screenshot" (builtins.readFile ./hypr/jonwin-cmd-screenshot.sh))

      # (writeScriptBin "jonwin-launch-or-focus" (builtins.readFile ./hypr/jonwin-launch-or-focus.sh))
      # (writeScriptBin "jonwin-launch-or-focus-tui" (builtins.readFile ./hypr/jonwin-launch-or-focus-tui.sh))
      # (writeScriptBin "jonwin-launch-or-focus-webapp" (
      #   builtins.readFile ./hypr/jonwin-launch-or-focus-webapp.sh
      # ))
      # (writeScriptBin "jonwin-launch-tui" (builtins.readFile ./hypr/jonwin-launch-tui.sh))
      # (writeScriptBin "jonwin-launch-webapp" (builtins.readFile ./hypr/jonwin-launch-webapp.sh))
      #
      # (writeScriptBin "jonwin-toggle-idle-inhibitor" (
      #   builtins.readFile ./hypr/jonwin-toggle-idle-inhibitor.sh
      # ))
      # (writeScriptBin "jonwin-toggle-nightlight" (builtins.readFile ./hypr/jonwin-toggle-nightlight.sh))

      (writeScriptBin "jonwin-wiki" (builtins.readFile ./jonwin-wiki.sh))
    ];
  };
}
