{ pkgs, inputs, user, host, ... }:
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
    imports = [
        ../modules
    ];

    programs = {
        steam = {
            enable = true;
        };
        thunar.enable = true;
        xfconf.enable = true;
        zsh.enable = true;
    };

	hardware.steam-hardware.enable = true;

    virtualisation.libvirtd = {
        enable = true;
        qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    programs.virt-manager.enable = true;

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
            extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" "uinput" "libvirtd" ];
        };
        groups = { uinput = {}; };
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

        flatpak.enable = true;
    };

    security = {
        sudo.wheelNeedsPassword = false;
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
            cargo
            cliphist
            cmake
            curl
            discord
            fastfetch
            fd
            freecad
            fzf
            gcc
            gimp
            grimblast
            hyprpolkitagent
            # itch
            kdePackages.qtwayland
            libnotify
            libsForQt5.qt5.qtwayland
            man-pages
            man-pages-posix
            openscad
            pavucontrol
            playerctl
            ripgrep
            rustc
            sddm-chili-theme
            texliveFull
            trash-cli
            tree
            unp
            unzip
            valgrind
            wget
            wl-clipboard
            wl-clip-persist
            zathura
            zip

            inputs.nixvim.packages.${system}.default

            (
                writeTextDir "share/sddm/themes/chili/theme.conf.user" ''
                    [General]
                    background=${background-package}

                    ScreenWidth=2560
                    ScreenHeight=1440
                ''
            )
        ];
        variables = { EDITOR = "nvim"; VISUAL = "nvim"; };
    };

    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        font-awesome
        corefonts
    ];

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
                devices = ["nodev"];
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
