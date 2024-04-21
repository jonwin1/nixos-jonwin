{ config, lib, pkgs, inputs, user, host, ... }:
{
  imports = [
    ../modules
  ];

  programs.zsh.enable = true;

  networking.hostName = "${host}";
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

  console.keyMap = "sv-latin1";

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "se";
        variant = "";
      };
      displayManager = {
        lightdm.enable = true;
      };
    };
    displayManager.autoLogin = {
      enable = true;
      user = "${user}";
    };
  };

  sound.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
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
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      curl
      feh
      firefox
      fzf
      gcc
      gimp
      light
      ripgrep
      unclutter-xfixes
      unzip
      wget
      xclip
      zathura

      inputs.nixvim.packages.${system}.default
    ];
  };

  fonts.packages = with pkgs; [
    fira-code-nerdfont
    font-awesome
    corefonts
  ];

  system.stateVersion = "23.11";
}
