{
  pkgs,
  user,
  ...
}:
{
  home-manager.users.${user}.home.packages = with pkgs; [
    grim
    slurp
    satty
    hyprpicker
    (writeScriptBin "jonwin-cmd-screenshot" (builtins.readFile ./jonwin-cmd-screenshot.sh))

    jq
    (writeScriptBin "jonwin-launch-or-focus" (builtins.readFile ./jonwin-launch-or-focus.sh))
    (writeScriptBin "jonwin-launch-or-focus-tui" (builtins.readFile ./jonwin-launch-or-focus-tui.sh))
    (writeScriptBin "jonwin-launch-or-focus-webapp" (
      builtins.readFile ./jonwin-launch-or-focus-webapp.sh
    ))
    (writeScriptBin "jonwin-launch-tui" (builtins.readFile ./jonwin-launch-tui.sh))
    chromium
    (writeScriptBin "jonwin-launch-webapp" (builtins.readFile ./jonwin-launch-webapp.sh))

    (writeScriptBin "jonwin-toggle-idle-inhibitor" (
      builtins.readFile ./jonwin-toggle-idle-inhibitor.sh
    ))
    (writeScriptBin "jonwin-toggle-nightlight" (builtins.readFile ./jonwin-toggle-nightlight.sh))
  ];
}
