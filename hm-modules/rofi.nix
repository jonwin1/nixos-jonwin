{ pkgs, ... }:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        font = "FiraCodeNerdFont 12";
        location = "top";
        theme = "glue_pro_blue";
    };
}
