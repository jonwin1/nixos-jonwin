{
  flake.homeModules.zenBrowser = { config, ... }: {
    programs.zen-browser.profiles.default.spaces = {
      Personal = {
        id = "c6de089c-410d-4206-961d-ab11f988d40a";
        position = 1000;
        icon = "🏠";
        container = config.programs.zen-browser.profiles.default.containers.Personal.id;
      };
      Work = {
        id = "cdd10fab-4fc5-494b-9041-325e5759195b";
        position = 2000;
        icon = "💼";
        container = config.programs.zen-browser.profiles.default.containers.Work.id;
      };
    };
  };
}
