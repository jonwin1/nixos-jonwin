{
  flake.homeModules.zenBrowser = {
    programs.zen-browser.profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      presets.betterfox.enable = true;

      containersForce = true;
      pinsForce = true;
      pinsForceAction = "demote";
      spacesForce = true;
    };
  };
}
