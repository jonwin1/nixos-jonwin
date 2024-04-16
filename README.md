# nixos-jonwin

sudo su

nix-shell -p git

git clone https://github.com/jonwin1/nixos-jonwin.git /mnt/etc/nixos

nixos-install --flake .#<host>

reboot

...
