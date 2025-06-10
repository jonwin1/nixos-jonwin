{ user, ... }:
{
  home-manager.users.${user}.services.dunst = {
    enable = true;
    settings = {
      global = {
        ### General ###
        follow = "keyboard";

        font = "FiraCode Nerd Font 10";
        sort = "yes";
        indicate_hidden = "yes";
        idle_threshold = 120;

        ### Geometry ###
        width = "(200, 400)";
        height = "(0, 200)";
        origin = "top-right";
        offset = "(10, 10)";
        notification_limit = 10;

        corner_radius = 10;
        corners = "all";
        frame_width = 2;
        frame_color = "#81a1c1";
        separator_height = 2;
        separator_color = "frame";
        padding = 8;
        horizontal_padding = 8;

        ### Progress bar ###
        progress_bar = true;
        progress_bar_height = 8;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 4;
        progress_bar_corners = "all";

        ### Text ###
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "center";
        vertical_alignment = "center";

        show_age_threshold = 60;
        ellipsize = "middle";

        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";

        ### History ###
        sticky_history = "yes";
        history_length = 20;

        ### Misc/Advanced ###
        browser = "/usr/bin/xdg-open";

        ### mouse
        mouse_left_click = "close_current";
      };

      urgency_low = {
        background = "#2e3440";
        foreground = "#d8dee9";
        timeout = 10;
      };

      urgency_normal = {
        background = "#4c566a";
        foreground = "#eceff4";
        timeout = 10;
        override_pause_level = 30;
      };

      urgency_critical = {
        background = "#bf616a";
        foreground = "#eceff4";
        frame_color = "#bf616a";
        timeout = 0;
        override_pause_level = 60;
      };
    };
  };
}
