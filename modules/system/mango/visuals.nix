{
  flake.wrappers.mangowc = {
    settings = {
      source = "~/.config/mango/noctalia.conf";

      # ---------- Theming ----------
      # Dimensions
      borderpx = 4;
      gappih = 5;
      gappiv = 5;
      gappoh = 5;
      gappov = 5;

      # ---------- Window management ----------
      scratchpad_width_ratio = 0.8;
      scratchpad_height_ratio = 0.9;

      # ---------- Window effects ----------
      # Blur
      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params_radius = 5;
      blur_params_num_passes = 2;
      blur_params_noise = 0.02;
      blur_params_brightness = 0.9;
      blur_params_contrast = 0.9;
      blur_params_saturation = 1.2;

      # Shadows
      shadows = 1;
      layer_shadows = 0;
      shadow_only_floating = 1;
      shadows_size = 4;
      shadows_blur = 10;
      shadows_position_x = 2;
      shadows_position_y = 2;

      # Opacity & Corner Radius
      border_radius = 10;
      no_radius_when_single = 0;
      focused_opacity = 1;
      unfocused_opacity = 1;

      # ---------- Animations ----------
      animations = 1;
      layer_animations = 0;

      animation_type_open = "slide";
      animation_type_close = "slide";

      animation_fade_in = 1;
      animation_fade_out = 1;
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;

      zoom_initial_ratio = 0.4;
      zoom_end_ratio = 0.8;

      animation_duration_move = 500;
      animation_duration_open = 400;
      animation_duration_tag = 300;
      animation_duration_close = 300;
      animation_duration_focus = 0;

      animation_curve_open = "0.46,1.0,0.29,0.99";
      animation_curve_move = "0.46,1.0,0.29,0.99";
      animation_curve_tag = "0.46,1.0,0.29,0.99";
      animation_curve_close = "0.46,1.0,0.29,0.99";
      animation_curve_focus = "0.46,1.0,0.29,0.99";
      animation_curve_opafadein = "0.46,1.0,0.29,0.99";
      animation_curve_opafadeout = "0.5,0.5,0.5,0.5";

      tag_animation_direction = 1;
    };
  };
}
