{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  systemd.user.services.docker = {
    enable = true;
  };
}
