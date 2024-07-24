{ pkgs }:
{
    environment = {
        systemPackages = with pkgs; [
            kitty
        ];
    };

    programs.hyprland.enable = true;
}
