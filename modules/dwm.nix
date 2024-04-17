{ config, lib, pkgs, inputs, user, ... }:

{
  services = {
    xserver = {
      enable = true;
      windowManager.dwm.enable = true;
      xkb = {
        layout = "se";
        variant = "";
      };
      displayManager = {
        lightdm.enable = true;
      };
      desktopManager.wallpaper.mode = "fill";
    };
    displayManager.autoLogin = {
      enable = true;
      user = "${user}";
    };
    getty.autologinUser = "${user}";

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.configPackages = [
        (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
          bluez_monitor.properties = {
            ["bluez5.enable-sbc-xq"] = true,
            ["bluez5.enable-msbc"] = true,
            ["bluez5.enable-hw-volume"] = true,
            ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          }
        '')
      ];
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { 
        src = prev.fetchFromGitHub {
          owner = "jonwin1";
          repo = "dwm-jonwin";
          rev = "main";
          hash = "sha256-+6N0SsreQ2Ig/kvQ/cuu1lKvFJjNDCncu/iQrNyPxmA=";
        };
      });
    })
  ];

  environment = {
    variables = {
      TERMINAL = "st-256color";
    };
    systemPackages = with pkgs; [
      (st.overrideAttrs (oldAttrs: rec {
        src = fetchFromGitHub {
          owner = "jonwin1";
          repo = "st-jonwin";
          rev = "main";
          sha256 = "11yf304arr35kxf2bwpzaqg8zgh5vgf92vn3ck88na0kxwavkjc4";
        };
        buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      }))
      (dmenu.overrideAttrs (oldAttrs: rec {
        src = fetchFromGitHub {
          owner = "jonwin1";
          repo = "dmenu-jonwin";
          rev = "main";
          sha256 = "bcVSCh+jX+RI8vX4uwIUek8c4JTsvOlk5e6lCLyqI7g=";
        };
      }))
      (slstatus.overrideAttrs (oldAttrs: rec {
        src = fetchFromGitHub {
          owner = "jonwin1";
          repo = "slstatus-jonwin";
          rev = "main";
          sha256 = "cs62ZdY1dk+ZXz8/WUwh4YWjohDiZqW/QLa6mmio9eo=";
        };
      }))
    ];
  };
  
  systemd.user.services.slstatus = {
    description = "slstatus";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/slstatus";
      RestartSec = 3;
      Restart = "always";
    };
  };
}

