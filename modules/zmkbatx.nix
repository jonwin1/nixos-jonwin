{
  user,
  pkgs,
  ...
}:
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      zmkbatx
    ];

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "sleep 1 && uwsm-app -- zmkbatx"
      ];
    };
  };
}
