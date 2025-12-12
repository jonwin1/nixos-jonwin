{
  config,
  lib,
  user,
  ...
}: {
  home-manager.users.${user} = {
    programs.hyprlock = {
      enable = true;

      settings = {
        # https://github.com/FireDrop6000/hyprland-mydots/blob/master/.config/hypr/hyprlock.conf
        # https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles/blob/main/home/.config/hypr/hyprlock.conf

        general = {
          immediate_render = true;
        };

        background = {
          blur_passes = 2;
          brightness = 0.5;
        };

        animations.enabled = false;

        input-field = {
          size = "32, 32";
          position = "-24, 24";
          halign = "right";
          valign = "bottom";
          outline_thickness = 0;
          hide_input = true;
          placeholder_text = "";
          fail_text = "\$FAIL";
        };

        label =
          lib.optionals config.jonwin.hasBattery [
            {
              # Battery
              text = "cmd[update:1000] echo \"\$(~/.config/scripts/battery-status)\"";
              font_size = 16;
              position = "-20, -10";
              halign = "right";
              valign = "top";
            }
          ]
          ++ [
            {
              # Date
              text = "cmd[update:1000] date +'%A, %d %B'";
              font_size = 22;
              halign = "center";
              valign = "top";
              position = "0, -160";
            }
            {
              # Time
              text = "cmd[update:1000] date +'%R'";
              font_size = 95;
              halign = "center";
              valign = "top";
              position = "0, -200";
            }
            {
              # Name
              text = "Jonatan Wincent";
              font_size = 18;
              position = "0, -125";
            }
            {
              # E-mail
              text = "jonatan.wincent@proton.me";
              font_size = 14;
              position = "0, -150";
            }
          ];

        # User Avatar
        image = {
          path = "~/Pictures/logo.png";
          size = 200;
          border_size = 0;
          position = "0, 0";
        };
      };
    };

    home.file = {
      "Pictures/logo.png" = {
        source = ./logo.png;
      };
    };
  };

  security.pam.services.hyprlock = {};
}
