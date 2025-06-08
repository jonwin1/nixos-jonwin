{
  virtualisation.docker = {
    enable = false; # Use rootless instead
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      pruning = {
        enabled = true;
        interval = "7d";
      };
    };
  };
}
