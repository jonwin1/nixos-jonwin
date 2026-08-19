{
  flake.homeModules.zenBrowser = {
    programs.zen-browser.profiles.default.containers = {
      Personal = {
        color = "blue";
        icon = "fingerprint";
        id = 1;
      };
      Work = {
        color = "yellow";
        icon = "briefcase";
        id = 2;
      };
    };
  };
}
