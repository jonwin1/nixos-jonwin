{
  pkgs,
  user,
  inputs,
  ...
}:
let
  freecadWayland = pkgs.symlinkJoin {
    name = "freecad-wayland-fix";
    paths = [
      pkgs.freecad-wayland
    ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/FreeCAD \
        --prefix MESA_LOADER_DRIVER_OVERRIDE : zink \
        --prefix __EGL_VENDOR_LIBRARY_FILENAMES : ${pkgs.mesa}/share/glvnd/egl_vendor.d/50_mesa.json \
    '';
  };
in
{
  home-manager.users.${user}.home.packages = with pkgs; [
    # Desktop apps
    cura-appimage
    discord
    freecadWayland
    gimp
    ladybird
    obsidian
    #openscad
    pavucontrol
    protonvpn-gui
    kdePackages.okular

    # CLI tools
    bc
    cliphist
    curl
    fastfetch
    fd
    fzf
    inputs.nvf.packages.${stdenv.hostPlatform.system}.default
    inputs.pomodoro.packages.${stdenv.hostPlatform.system}.default
    jq
    ripgrep
    trash-cli
    tree
    viu
    wget
    wl-clipboard
    wl-clip-persist
    wlrctl

    # Unzip everything
    p7zip
    unp
    unrar
    unzip
    zip

    # Coding
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
