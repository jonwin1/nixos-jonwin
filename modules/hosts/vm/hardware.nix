{ self, inputs, ... }: {
  flake.nixosModules.vmHardware = { lib, modulesPath, ... }: {
    imports = [
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [
      "ahci"
      "virtio_pci"
      "virtio_scsi"
      "xhci_pci"
      "sr_mod"
      "virtio_blk"
    ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/4893547b-e99d-459c-af3b-819374100d5e";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/EA1A-49B7";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    fileSystems."/home/jonwin/nixos-jonwin" = {
      device = "nixos-jonwin";
      fsType = "virtiofs";
    };

    swapDevices = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
