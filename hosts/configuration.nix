{
  pkgs,
  inputs,
  user,
  host,
  ...
}:
let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "background-image";
    src = ../.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
in
{
  imports = [ ../modules ];

  programs = {
    direnv.enable = true;
    nm-applet.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession = {
        enable = true;
      };
      protontricks.enable = true;
    };
    thunar.enable = true;
    virt-manager.enable = true;
    xfconf.enable = true;
    zsh.enable = true;
  };

  xdg = {
    mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "thunar.desktop";
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/png" = "gimp.desktop";
        "image/jpeg" = "gimp.desktop";
      };
    };

    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  hardware.steam-hardware.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };

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
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "input"
        "uinput"
        "libvirtd"
      ];
    };
    groups = {
      uinput = { };
    };
  };

  services = {
    blueman.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "chili";
      settings = {
        General = {
          DefaultSession = "hyprland.desktop";
        };
      };
    };
    gvfs.enable = true;
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
    tumbler.enable = true;
    udisks2.enable = true;
  };

  security = {
    rtkit.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixVersions.stable;
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
      bc
      cliphist
      cura-appimage
      curl
      discord
      fastfetch
      fd
      freecad-wayland
      fzf
      gcc
      ghostty
      gimp
      gnumake
      grimblast
      hyprpolkitagent
      inputs.pomodoro.packages.${system}.default
      # itch
      kdePackages.qtwayland
      ladybird
      libnotify
      libsForQt5.qt5.qtwayland
      man-pages
      man-pages-posix
      obsidian
      openscad
      p7zip
      pavucontrol
      playerctl
      yazi
      ripgrep
      sddm-chili-theme
      trash-cli
      tree
      tree-sitter
      unp
      unrar
      unzip
      wget
      wl-clipboard
      wl-clip-persist
      wlrctl
      xfce.xfce4-settings
      zathura
      zip

      (python3.withPackages (python-pkgs: with python-pkgs; [ ds4drv ]))

      (writeTextDir "share/sddm/themes/chili/theme.conf.user" ''
        [General]
        background=${background-package}

        ScreenWidth=2560
        ScreenHeight=1440
      '')
    ];
  };

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 10;
      };
      timeout = 5;
    };
  };

  documentation.dev.enable = true;

  system.stateVersion = "23.11";
}
