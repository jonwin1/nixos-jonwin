{ config, lib, pkgs, inputs, user, ... }:

{
  services = {
    xserver = {
      windowManager.dwm = {
        enable = true;
        package = inputs.dwm.packages."x86_64-linux".default;
      };
    };
  };

#  nixpkgs.overlays = [
#    (final: prev: {
#      dwm = prev.dwm.overrideAttrs (old: { 
#        src = prev.fetchFromGitHub {
#          owner = "jonwin1";
#          repo = "dwm-jonwin";
#          rev = "main";
#          hash = "sha256-QnFfkPYV6MYwJZ19kwuFTeVu7lCBSSNimW3Bvj4NUlg=";
#        };
#      });
#    })
#  ];

  environment = {
    variables = {
      TERMINAL = "st";
    };
    systemPackages = with pkgs; [
      xorg.libXext
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
          sha256 = "YY3NA6UTmRjFgiAGMwMTeuXBoswbzT9MOfIUi/OcIuI=";
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

