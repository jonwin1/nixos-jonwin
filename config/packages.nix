{
  pkgs,
  user,
  inputs,
  ...
}: {
  home-manager.users.${user}.home.packages = with pkgs; [
    # Desktop apps
    chromium
    cura-appimage
    discord
    freecad-wayland
    gimp
    ladybird
    obsidian
    #openscad
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
    zmkBATx

    # launch commands (heavily inspired by the omarchy-launch commands)

    (writeShellScriptBin "jonwin-launch-tui" ''
      exec setsid uwsm-app -- ghostty \
        --class="se.jonwin.$(basename "$1")" \
        --command="$1" "''${@:2}"
    '')

    (writeShellScriptBin "jonwin-launch-webapp" ''
      exec setsid uwsm-app -- chromium --app="$1" "''${@:2}"
    '')

    (writeShellScriptBin "jonwin-launch-or-focus" ''
      if (($# == 0)); then
        echo "Usage: jonwin-launch-or-focus [window-pattern] [launch-command]"
        exit 1
      fi

      WINDOW_PATTERN="$1"
      LAUNCH_COMMAND="''${2:-"uwsm-app -- $WINDOW_PATTERN"}"
      WINDOW_ADDRESS=$(hyprctl clients -j | jq -r --arg p "$WINDOW_PATTERN" '.[]|select((.class|test("\\b" + $p + "\\b";"i")) or (.title|test("\\b" + $p + "\\b";"i")))|.address' | head -n1)

      if [[ -n $WINDOW_ADDRESS ]]; then
        hyprctl dispatch focuswindow "address:$WINDOW_ADDRESS"
      else
        eval exec setsid $LAUNCH_COMMAND
      fi
    '')

    (writeShellScriptBin "jonwin-launch-or-focus-tui" ''
      APP_ID="se.jonwin.$(basename $1)"
      LAUNCH_COMMAND="jonwin-launch-tui $@"

      exec jonwin-launch-or-focus "$APP_ID" "$LAUNCH_COMMAND"
    '')

    (writeShellScriptBin "jonwin-launch-or-focus-webapp" ''
      if (($# == 0)); then
        echo "Usage: jonwin-launch-or-focus-webapp [window-pattern] [url-and-flags...]"
        exit 1
      fi

      WINDOW_PATTERN="$1"
      shift
      LAUNCH_COMMAND="jonwin-launch-webapp $@"

      exec jonwin-launch-or-focus "$WINDOW_PATTERN" "$LAUNCH_COMMAND"
    '')
  ];
}
