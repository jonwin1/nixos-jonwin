{ config, pkgs, ... }:

{
  # Home Manager needs a bit of informations about you and the
  # paths it should manage.
  home.username = "jonwin";
  home.homeDirectory = "/home/jonwin";

  # This value determines the Home Manager release that your
  # configuration is compative with. This helps avoid breakage
  # when a new Home Manager release intruduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
