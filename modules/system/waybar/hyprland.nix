{ self, ... }: {
  flake.nixosModules.waybarHyprland = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.waybarHyprland
    ];
  };

  flake.homeModules.waybarHyprland = {
    programs.waybar.settings = {
      main = {
        modules-left = [
          "hyprland/workspaces"
        ];

        "hyprland/workspaces" = {
          show-special = true;
          format = "{icon}";
          format-icons = {
            default = "󰞋";
            "1" = "󰎤";
            "2" = "󰎧";
            "3" = "󰎪";
            "4" = "󰎭";
            "5" = "󰎱";
            "6" = "󰎳";
            "7" = "󰎶";
            "8" = "󰎹";
            "9" = "󰎼";
            "10" = "󰽽";
            scratchpad = "󰏬";
            discord = "󰙯";
            music = "󰎄";
            wiki = "󰈚";
          };
        };
      };
    };
  };
}
