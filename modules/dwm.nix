{ config, lib, pkgs, inputs, user, ... }:
{
  services = {
    xserver = {
      enable = true;
      windowManager.dwm = {
        enable = true;
        package = inputs.dwm.packages."x86_64-linux".default;
      };
      xkb = {
        layout = "se";
        variant = "";
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
      inputs.dmenu.packages."x86_64-linux".default
      inputs.st.packages."x86_64-linux".default
      inputs.slstatus.packages."x86_64-linux".default
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

