{ user, ... }:
{
  home-manager.users.${user}.services.dunst = {
    enable = true;
    settings = {
      global = {
        ### General ###
        follow = "keyboard";
        idle_threshold = 120;
        notification_limit = 10;

        ### Geometry ###
        width = "(200, 400)";
        height = "(0, 200)";
        origin = "top-right";
        offset = "(10, 10)";
        corner_radius = 4;
        frame_width = 2;

        ### Text ###
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "center";

        ### Misc/Advanced ###
        dmenu = "rofi -dmenu";
        browser = "/usr/bin/xdg-open";

        ### Mouse
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "open_url";
        mouse_right_click = "context";
      };

      urgency_low = {
        timeout = 10;
      };

      urgency_normal = {
        timeout = 10;
        override_pause_level = 30;
      };

      urgency_critical = {
        timeout = 0;
        override_pause_level = 60;
      };
    };
  };
}
