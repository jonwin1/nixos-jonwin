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
          hash = "sha256-y0aMEuVF5Ro3DtFVqaMTYFIls41ahSYBmrXWnv2f3z8=";
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
          sha256 = "HbHpPBgefXNvv0fZcGVo9ygueSWGgywFIdsoEKQSPEQ=";
        };
        buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      }))
      (dmenu.overrideAttrs (oldAttrs: rec {
        src = fetchFromGitHub {
          owner = "jonwin1";
          repo = "dmenu-jonwin";
          rev = "main";
          sha256 = "GjnkXYFGn4JHQaQJJveEUGlMD+xMTD1oVOVcrCJQrIc=";
        };
      }))
      (slstatus.overrideAttrs (oldAttrs: rec {
        src = fetchFromGitHub {
          owner = "jonwin1";
          repo = "slstatus-jonwin";
          rev = "main";
          sha256 = "JqmT/Cm5lW95m3nHffjZno4QhUGlQm0SShc8ei0feEQ=";
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

