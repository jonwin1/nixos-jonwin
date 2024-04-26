{ config, lib, pkgs, inputs, user, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      kmonad
    ];
  };

  services = {
    kmonad = {
      enable = true;
      keyboards = {
        lgpro = {
          device = "/dev/input/by-id/usb-Logitech_PRO_Gaming_Keyboard_076D31413931-event-kbd";
          config = ''
            (defcfg
              input (device-file "/dev/input/by-id/usb-Logitech_PRO_Gaming_Keyboard_076D31413931-event-kbd")
              output (uinput-sink "kmonad output")
              fallthrough false
            )
            (defsrc
            esc     f1      f2      f3      f4      f5      f6      f7      f8      f9      f10     f11
            1       2       3       4       5       6       7       8       9       0       -       =
            tab     q       w       e       r       t       u       i       o       p       [       ]
            caps    a       s       d       f       g       j       k       l       ;       '       \
                                    c       v       b       n       m       ,
                                                    spc
            )
            (defalias
                up (layer-toggle up)
                down (layer-toggle down)
                del (tap-hold-next-release 200 del @down)
                ret (tap-hold-next-release 200 ret @up)
            )
            (deflayer base
            caps    1       2       3       4       5       6       7       8       9       0       rmet
            tab     q       w       e       r       t       y       u       i       o       p       [
            esc     a       s       d       f       g       h       j       k       l       ;       '
            lctl    z       x       c       v       b       n       m       ,       .       /       ralt
                                    lmet    spc     @up     @ret    bspc    @del
                                                    @down
            )
            (deflayer up
            f12     f1      f2      f3      f4      f5      f6      f7      f8      f9      f10     f11
            S-tab   Q       W       E       R       T       Y       U       I       O       P       S-[
            S-esc   A       S       D       F       G       H       J       K       L       S-;     S-'
            S-lctl  Z       X       C       V       B       N       M       S-,     S-.     S-/     S-ralt
                                    S-lmet  S-spc   XX      XX      S-bspc  S-del
                                                    XX
            )
            (deflayer down
            XX      102d    RA-102d RA--    S-7     S-102d  RA-]    -       S-0     \       S-2     rmet
            tab     RA-7    S-6     S-\\    S--     RA-0 previoussong vold	volu nextsong   mute    RA-\
            esc     S-8     RA-4    S-5     S-]     S-9     left    down    up      right playpause stop
            lctl    RA-8    S-1     RA-2    S-3     RA-9    home    pgdn    pgup    end     ins     ralt
                                    lmet    spc     lsft    ret     bspc    XX
                                                    XX
            )
          '';
        };
      };
    };
  };
}
