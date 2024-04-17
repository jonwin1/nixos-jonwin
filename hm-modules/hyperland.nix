{ config, lib, pkgs, inputs, user, ... }:

{
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        settings = {
          "$mod" = "SUPER";
          bind = [
            "$mod, F, exec, firefox"
            "$mod, S, exec, rofi -show drun -show-icons"
          ] ++ (
            builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )10)
          );
        };
      };
    };
  };

  home = {
    packages = with pkgs; [
      waybar
      dunst
      libnotify
      swww
      kitty
      rofi-wayland
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  xdg.portal.config.common.default = "*";
}
