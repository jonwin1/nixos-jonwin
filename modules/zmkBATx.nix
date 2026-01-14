{
  user,
  pkgs,
  ...
}:
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      zmkBATx
    ];

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "sleep 1 && uwsm-app -- zmkbatx"
      ];
    };
  };
}
