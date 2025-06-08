{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ home-manager ];
  imports = [ inputs.home-manager.nixosModules.default ];
}
