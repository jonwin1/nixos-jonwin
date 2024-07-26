{ pkgs, ... }:
{
    environment = {
        systemPackages = with pkgs; [
            kitty
            libsForQt5.qt5.qtwayland
        ];
    };

    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}