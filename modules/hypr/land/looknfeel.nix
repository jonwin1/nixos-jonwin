{
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 2;
      gaps_in = 0;
      gaps_out = 0;
      layout = "dwindle";
    };

    decoration = {
      rounding = 2;
      active_opacity = 0.95;
      inactive_opacity = 0.9;
      blur.size = 8;
    };
    animations.enabled = false;

    group = {
      groupbar = {
        font_size = 12;
        font_family = "monospace";
        font_weight_active = "ultraheavy";
        font_weight_inactive = "normal";

        height = 22;
        indicator_height = 0;
        indicator_gap = 0;
        gaps_in = 0;
        gaps_out = 0;

        gradients = true;
        gradient_rounding = 2;
        gradient_round_only_edges = true;
      };
    };

    dwindle = {
      force_split = 2;
      preserve_split = true;
      special_scale_factor = 0.8;
      single_window_aspect_ratio = "4 3";
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;

      vrr = 2;

      middle_click_paste = false;
    };

    xwayland = {
      force_zero_scaling = true;
    };
  };
}
