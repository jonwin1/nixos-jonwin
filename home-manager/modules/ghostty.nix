{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      ghostty
    ];

    file.".config/ghostty" = {
      source = ../../dotconfig/ghostty;
      recursive = true;
    };
  };
}
