{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
            };

            background = [
                {
                    path = "~/Pictures/wallpaper.png";
                    blur_passes = 2;
                }
            ];

            input-field = [
                {
                    monitor = "";
                    size = "300, 60";
                    outline_thickness = 2;
                    dots_size = 0.2;
                    dots_spacing = 0.35;
                    dots_center = true;
                    outer_color = "rgba(0, 0, 0, 0)";
                    inner_color = "rgba(0, 0, 0, 0.2)";
                    font_color = "rgb(202, 211, 245)";
                    fade_on_empty = false;
                    rounding = -1;
                    check_color = "rgb(104, 136, 34)";
                    placeholder_text = "<span foreground=\"##cdd6f4\">Enter Password...</span>";
                    hide_input = false;
                    position = "0, -200";
                    halign = "center";
                    valign = "center";
                }
            ];
            label = [
                # DATE
                {
                    monitor = "";
                    text = "cmd[update:1000] date +'%A, %d %B'";
                    color = "rgba(242, 243, 244, 0.75)";
                    font_size = 22;
                    font_family = "FiraCodeNerdFont";
                    position = "0, 300";
                    halign = "center";
                    valign = "center";
                }

                # TIME
                {
                    monitor = "";
                    text = "cmd[update:1000] date +\"%R\"";
                    color = "rgba(242, 243, 244, 0.75)";
                    font_size = 95;
                    font_family = "FiraCodeNerdFont";
                    position = "0, 200";
                    halign = "center";
                    valign = "center";
                }
            ];
        };
    };

}
