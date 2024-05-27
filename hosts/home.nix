{ config, lib, pkgs, user, host, ... }:
{
  imports = [
    ../hm-modules
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    file = {
      "backgrounds" = {
        source = ../backgrounds;
        recursive = true;
      };
      ".config/bwm" = {
        source = ../dotconfig/bwm;
        recursive = true;
      };
    };
  };

  services = {
    random-background = {
      enable = true;
      display = "fill";
      imageDirectory = "%h/backgrounds";
      interval = "1h";
    };
  };

  programs = {
    home-manager.enable = true;
    qutebrowser = {
      enable = true;
      settings = {
        confirm_quit = [ "multiple-tabs" "downloads" ];
        fonts.default_size = "12pt";
        tabs.show = "multiple";
        statusbar.show = "in-mode";
        url = {
          default_page = "https://searxng.jonwin.se/";
          start_pages = "https://searxng.jonwin.se/";
        };
        content.autoplay = false;
      };
      searchEngines = { DEFAULT = "https://searxng.jonwin.se/search?q={}"; };
    };
  };

  home.stateVersion = "23.11";
}
