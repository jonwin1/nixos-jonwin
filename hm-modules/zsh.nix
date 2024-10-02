{ pkgs, host, ...}:
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
                ripgrep = "batgrep";

                tp = "trash-put -v";
                tl = "trash-list";
                trs = "trash-restore";
                trm = "trash-rm";
                te = "trash-empty";

                "..." = "../..";
                "...." = "../../..";
                "....." = "../../../..";

                nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-jonwin#${host}";
                nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-jonwin#${host}";
                nix-update = "nix flake update ~/nixos-jonwin# --commit-lock-file";
                nix-clean = "sudo nix-collect-garbage --delete-older-than 7d && nix-collect-garbage --delete-older-than 7d";
                nix-clean-all = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && nix-collect-garbage && nix-collect-garbage -d";

                ndev = "nix develop -c $SHELL";

                ga = "git add";
                gaa = "git add --all";
                gb = "git branch";
                gc = "git commit";
                gch = "git checkout";
                gchb = "git checkout -b";
                gcm = "git commit -m";
                gd = "batdiff";
                gf = "git fetch";
                gm = "git merge";
                gpl = "git pull";
                gps = "git push";
                gs = "git status";
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
                batdiff
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
