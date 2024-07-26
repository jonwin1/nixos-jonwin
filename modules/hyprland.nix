{ pkgs, ... }:
{
    environment = {
        systemPackages = with pkgs; [
            kitty
            libsForQt5.qt5.qtwayland
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
        ];
    };

    programs.hyprland = {
        enable = true;
        xwayland = {
            enable = true;
        };
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
