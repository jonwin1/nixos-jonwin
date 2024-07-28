{ pkgs, ... }:
{
    environment = {
        systemPackages = with pkgs; [
            kitty
            libsForQt5.qt5.qtwayland
            kdePackages.qtwayland
            kdePackages.polkit-kde-agent-1
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
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM="wayland";
    };
}
