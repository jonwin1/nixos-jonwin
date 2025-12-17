{
  pkgs,
  user,
  ...
}: {
  home-manager.users.${user}.home.packages = with pkgs; [
    grim
    slurp
    satty
    wayfreeze # TODO: replace with hyprpicker
    (writeScriptBin "jonwin-cmd-screenshot" (builtins.readFile ./jonwin-cmd-screenshot.sh))
  ];
}
