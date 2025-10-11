{user, ...}: {
  home-manager.users.${user} = {pkgs, ...}: {
    home.packages = with pkgs; [
      fahclient
    ];
  };
  services.foldingathome = {
    enable = false;
    user = "Jonwin";
    team = 37451;
  };
}
