{ self, ... }: {
  flake = {
    nixosModules.laptopConfiguration = { config, ... }: {
      my = {
        username = "jonwin";
        hostname = "laptop";
        luksPart = "/dev/disk/by-uuid/b210ba96-0c19-400b-93f1-0ef35d6ddef7";
        backlight = "amdgpu_bl2";
        kbdBacklight = "platform::kbd_backlight";
      };

      home-manager.users.${config.my.username}.imports = [ self.homeModules.laptopHome ];

      boot = {
        kernelParams = [
          "reboot=bios"
        ];
      };

      # Enable the dedicated GPU and increase frame rate
      specialisation.nvidia.configuration = {
        imports = [
          self.nixosModules.nvidiaDrivers
          self.nixosModules.nvidiaPrime
        ];

        my.amdgpuBusId = "PCI:5:0:0";
        my.nvidiaBusId = "PCI:1:0:0";

        home-manager.users.${config.my.username} = {
          wayland.windowManager.hyprland.settings.monitor = [
            "eDP-1, 2560x1600@120, 0x0, 1.6"
          ];
        };
      };
    };

    homeModules.laptopHome = { pkgs, ... }: {
      home.packages = with pkgs; [
        freecad-wayland
        heroic
        proton-vpn
      ];
    };
  };
}
