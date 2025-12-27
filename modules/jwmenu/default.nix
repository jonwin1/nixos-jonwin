{ user, ... }:
{
  home-manager.users.${user} =
    { pkgs, inputs, ... }:
    {
      home = {
        packages = with pkgs; [
          inputs.jwmenu.packages.${stdenv.hostPlatform.system}.default
        ];

        file = {
          ".config/jwmenu" = {
            source = ./menus;
            recursive = true;
          };
        };
      };
    };
}
