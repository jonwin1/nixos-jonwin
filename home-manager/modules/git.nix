{
  programs.git = {
    enable = true;
    userName = "Jonatan Wincent";
    userEmail = "jonatan.wincent@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      # pull.rebase = true;
      # rerere.enabled = true;
    };
  };
}
