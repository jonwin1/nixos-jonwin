{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    cura-appimage
    discord
    freecad-wayland
    gimp
    ladybird
    obsidian
    openscad
    pavucontrol
    zathura

    # CLI tools
    bc
    cliphist
    curl
    fastfetch
    fd
    fzf
    grimblast
    inputs.pomodoro.packages.${system}.default
    playerctl
    ripgrep
    trash-cli
    tree
    wget
    wl-clipboard
    wl-clip-persist
    wlrctl
    yazi

    # Unzip everything
    p7zip
    unp
    unrar
    unzip
    zip

    # Coding
    gcc
    gnumake
    tree-sitter

    # WM/DE
    hyprpolkitagent
    kdePackages.qtwayland
    libnotify
    libsForQt5.qt5.qtwayland
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
