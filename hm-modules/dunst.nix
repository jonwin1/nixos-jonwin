{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        ### Display ###
        monitor = 0;
        follow = "none";

        ### Geometry ###
        width = 350;
        height = 300;
        origin = "top-right";
        offset = "10x30";
        scale = 0;
        notification_limit = 20;

        ### Progress bar ###
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 4;
        progress_bar_corners = "all";

        icon_corner_radius = 4;
        icon_corners = "all";

        indicate_hidden = "yes";

        transparency = 10;

        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;

        frame_width = 3;

        frame_color = "#88c0d0";

        gap_size = 0;
        separator_color = "auto";

        sort = "yes";

        idle_threshold = 120;

        ### Text ###

        font = "FiraCode Nerd Font 8";
        line_height = 0;

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

        ### Icons ###

        enable_recursive_icon_lookup = true;

        icon_theme = "Adwaita";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";

        ### History ###

        sticky_history = "yes";
        history_length = 20;

        ### Misc/Advanced ###

        dmenu = "/usr/bin/dmenu -p dunst:";
        browser = "/usr/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";

        corner_radius = 5;
        corners = "all";

        ignore_dbusclose = false;

        ### Wayland ###
        force_xwayland = false;

        ### Legacy
        force_xinerama = false;

        ### mouse

        mouse_left_click = "close_current";
        mouse_middle_click = ["upen_url" "close_current"];
        mouse_right_click = "do_action";
      };

      urgency_low = {
        background = "#2e3440";
        foreground = "#d8dee9";
        timeout = 10;
        #default_icon = /path/to/icon
      };

      urgency_normal = {
        background = "#4c566a";
        foreground = "#eceff4";
        timeout = 10;
        override_pause_level = 30;
        #default_icon = /path/to/icon
      };

      urgency_critical = {
        background = "#bf616a";
        foreground = "#eceff4";
        frame_color = "#d08770";
        timeout = 0;
        override_pause_level = 60;
        #default_icon = /path/to/icon
      };
    };
  };
}
