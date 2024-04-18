{ config, lib, pkgs, inputs, user, ... }:

{
  services = {
    xserver = {
      windowManager.dwm.enable = true;
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

