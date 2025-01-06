{
    programs.git = {
        enable = true;
        lfs.enable = true;
        # userName = "jonwin1";
        # userEmail = "jonatan.wincent@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
            pull.rebase = true;
            rerere.enabled = true;
        };
    };
}
