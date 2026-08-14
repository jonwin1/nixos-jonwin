{ self, ... }: {
  flake.nixosModules.mango = { pkgs, ... }: {
    programs.mango = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.mangowc;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
    };

    systemd.user.targets.mango-session = {
      description = "mango compositor session";
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };
  };

  flake.wrappers.mangowc = { wlib, ... }: {
    imports = [ wlib.wrapperModules.mangowc ];

    settings = {
      monitorrule = "name:^eDP-1$,width:2560,height:1600,refresh:120,x:0,y:0,scale:1.6,vrr:1";

      exec-once = [
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE"
        "systemctl --user reset-failed"
        "systemctl --user start mango-session.target"

        "wl-clip-persist --clipboard both"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # Scroller Layout Setting
      scroller_structs = 20;
      scroller_default_proportion = 0.8;
      scroller_focus_center = 0;
      scroller_prefer_center = 0;
      edge_scroller_pointer_focus = 1;
      edge_scroller_focus_allow_speed = 0.0;
      scroller_default_proportion_single = 1.0;
      scroller_proportion_preset = "0.5,0.8,1.0";

      # Master-Stack Layout Setting
      new_is_master = 1;
      default_mfact = 0.55;
      default_nmaster = 1;
      smartgaps = 0;

      # Dwindle Layout Setting
      dwindle_smart_split = 0;
      dwindle_drop_simple_split = 1;
      dwindle_manual_split = 0;
      dwindle_hsplit = 1;
      dwindle_vsplit = 1;
      dwindle_preserve_split = 0;

      # Overview Setting
      hotarea_size = 10;
      enable_hotarea = 0;
      ov_tab_mode = 0;
      ov_no_resize = 1;
      overviewgappi = 5;
      overviewgappo = 30;

      # Misc
      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      focus_on_activate = 1;
      idleinhibit_ignore_visible = 0;
      sloppyfocus = 1;
      warpcursor = 1;
      focus_cross_monitor = 0;
      focus_cross_tag = 0;
      enable_floating_snap = 0;
      snap_distance = 30;
      cursor_size = 24;
      drag_tile_to_tile = 1;
      drag_tile_small = 1;

      # keyboard
      repeat_rate = 25;
      repeat_delay = 600;
      numlockon = 0;
      xkb_rules_layout = "se";
      xkb_rules_options = "caps:escape";

      # Trackpad
      # need relogin to make it apply
      disable_trackpad = 0;
      tap_to_click = 1;
      tap_and_drag = 1;
      drag_lock = 1;
      trackpad_natural_scrolling = 0;
      disable_while_typing = 1;
      left_handed = 0;
      middle_button_emulation = 0;
      swipe_min_threshold = 1;

      # mouse
      # need relogin to make it apply
      mouse_natural_scrolling = 0;

      # Layout
      circle_layout = "tile,scroller,fair,dwindle,center_tile,right_tile,vertical_scroller";
      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];

      # layer rule
      layerrule = [
        "animation_type_open:zoom,layer_name:rofi"
        "animation_type_close:zoom,layer_name:rofi"
      ];
    };
  };
}
