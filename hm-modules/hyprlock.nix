{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 10;
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
          font_color = "rgb(216, 222, 233)";
          fade_on_empty = false;
          placeholder_text = "<i>Enter Password...</i>";
          hide_input = false;
          rounding = -1;
          check_color = "rgb(163, 190, 140)";
          fail_color = "rgb(191, 97, 106)";
          capslock_color = "rgb(208, 135, 112)";
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
          color = "rgba(216, 222, 233, 0.75)";
          font_size = 22;
          font_family = "FiraCode Nerd Font";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }

        # TIME
        {
          monitor = "";
          text = "cmd[update:1000] date +\"%R\"";
          color = "rgba(216, 222, 233, 0.75)";
          font_size = 95;
          font_family = "FiraCode Nerd Font";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

}
