{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-rbw-wayland ];
  programs.rbw = {
    enable = true;
    settings = {
      email = "jonatan.wincent@gmail.com";
      pinentry = pkgs.pinentry-gtk2;
    };
  };
}
