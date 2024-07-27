{ lib, ...}:
{
    programs.waybar = {
        settings = {
            mainBar = {
                "cpu" = {
                    format = lib.mkForce " {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}{icon8}{icon9}{icon10}{icon11}{icon12}{icon13}{icon14}{icon15} ";
                };

                "temperature" = {
                    thermal-zone = lib.mkForce 0;
                };
            };
        };
    };
}
