{ pkgs, host, ... }:
{
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";

      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;

      defaultKeymap = "viins";

      history = {
        share = true;
        save = 1000;
        size = 1000;
        extended = true;
        ignoreDups = true;
        ignoreAllDups = true;
        ignoreSpace = true;
        expireDuplicatesFirst = true;
        path = "$HOME/.cache/zsh_history";
      };

      initContent = ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "$\{(s.:.)LS_COLORS}"
      '';

      shellAliases = {
        #sudo = "sudo ";

        c = "clear";
        cd = "z";
        cp = "cp -riv";
        la = "ls -lhA";
        l = "ls -lh";
        mkdir = "mkdir -vp";
        mv = "mv -iv";
        # rm = "rm -rifv";
        rm = "echo \"Use tp\"";
        v = "nvim";

        cat = "bat";
        man = "batman";

        tp = "trash -v";
        tl = "trash-list";
        te = "trash-empty";

        "..." = "../..";
        "...." = "../../..";
        "....." = "../../../..";

        nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-jonwin#${host}";
        nix-clean = "sudo nix-collect-garbage --delete-older-than 7d && nix-collect-garbage --delete-older-than 7d";
        nix-clean-all = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && nix-collect-garbage && nix-collect-garbage -d";

        ndev = "nix develop -c $SHELL";

        lg = "lazygit";
        ga = "git add";
        gaa = "git add --all";
        gb = "git branch";
        gc = "git commit";
        # gch = "git checkout";
        # gchb = "git checkout -b";
        gcm = "git commit -m";
        gd = "git diff";
        gds = "git diff --staged";
        gf = "git fetch";
        gl = "git log --graph";
        gm = "git merge";
        gpl = "git pull";
        gps = "git push";
        gr = "git restore";
        gs = "git status";
        gsw = "git switch";
        gswc = "git switch -c";
      };
      plugins = with pkgs; [
        {
          name = "zsh-fzf-tab";
          src = zsh-fzf-tab;
          file = "share/fzf-tab/fzf-tab.plugin.zsh";
        }
        {
          name = "zsh-nix-shell";
          src = zsh-nix-shell;
          file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        }
        {
          name = "zsh-vi-mode";
          src = zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batgrep
        batman
      ];
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
