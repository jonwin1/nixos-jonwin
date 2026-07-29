{
  flake.homeModules.git = {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "Jonatan Wincent";
          email = "jonatan.wincent@proton.me";
        };

        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = false;
      };
    };
  };
}
