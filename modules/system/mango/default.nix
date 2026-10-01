{ self, inputs, ... }: {
  flake = {
    nixosModules.mango = { config, ... }: {
      home-manager.users.${config.my.username}.imports = [
        self.homeModules.mango
      ];

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        WLR_DRM_NO_ATOMIC = 1;
      };
    };

    homeModules.mango = {
      imports = [
        inputs.mangowm.hmModules.mango
      ];

      wayland.windowManager.mango = {
        enable = true;
        systemd.enable = true;
        settings = {
          exec-once = [
            "wl-clip-persist --clipboard regular"
            "wl-paste --type text --watch cliphist store"
            "wl-paste --type image --watch cliphist store"
          ];

          # ---------- Monitors ----------

          allow_tearing = 1;

          # ---------- Input Device ----------

          # Keyboard
          numlockon = 1;
          xkb_rules_layout = "se";
          xkb_rules_options = "caps:escape";

          # Mouse
          mouse_accel_profile = 0;

          # ---------- Miscellaneous ----------

          syncobj_enable = 1;
          sloppyfocus = 0;
          cursor_hide_timeout = 1;
          drag_tile_to_tile = 1;
          scratchpad_cross_monitor = 1;
          tag_gather = 1;
        };
      };
    };
  };
}
