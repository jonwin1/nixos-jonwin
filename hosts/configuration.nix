{ config, lib, pkgs, inputs, user, ... }:

{
  imports = [
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

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

  console.keyMap = "sv-latin1";

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";

    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment = {
    variables = {
      TERMINAL = "st-256color";
    };
    systemPackages = with pkgs; [
      curl
      dunst
      feh
      firefox
      gcc
      gimp
      light
      picom
      unclutter-xfixes
      unzip
      wget
      xclip
      zathura

      inputs.nixvim.packages.${system}.default

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

  fonts.packages = with pkgs; [
    fira-code
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

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

  system.stateVersion = "23.11";
}
