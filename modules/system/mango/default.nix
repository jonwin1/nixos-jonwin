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
      exec-once = [
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE"
        "systemctl --user reset-failed"
        "systemctl --user start mango-session.target"

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

      syncobj_enable=1;
      sloppyfocus = 0;
      cursor_hide_timeout = 1;
      drag_tile_to_tile = 1;
    };
  };
}
