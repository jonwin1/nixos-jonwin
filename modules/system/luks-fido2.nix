{
  flake.nixosModules.luks-fido2 = { lib, config, ... }: {
    options.my.luksPart = lib.mkOption {
      type = lib.types.str;
      example = "/dev/disk/by-uuid/abcd1234-5ef6-7g89-0hij-1kl2mno34567";
      description = "The encrypted LUKS partition.";
    };

    config = {
      boot.initrd = {
        systemd.enable = true;
        luks.devices.encrypted = {
          device = config.my.luksPart;
          crypttabExtraOpts = [ "fido2-device=auto" ];
        };
      };
    };
  };
}
