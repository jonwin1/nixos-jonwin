{ config, lib, pkgs, inputs, user, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      kmonad
    ];
  };

  services = {
    xserver = {
      xkb = {
        layout = lib.mkForce "us";
        options = "compose:ralt";
      };
    };
    kmonad = {
      enable = true;
      keyboards = {
        lgpro = {
          device = "/dev/input/by-id/usb-Logitech_PRO_Gaming_Keyboard_076D31413931-event-kbd";
          config = ''
            (defcfg
              input (device-file "/dev/input/by-id/usb-Logitech_PRO_Gaming_Keyboard_076D31413931-event-kbd")
              output (uinput-sink "kmonad output")
              cmp-seq ralt
              cmp-seq-delay 5
              fallthrough false
            )
            (defsrc
            esc     f1      f2      f3      f4      f5      f6      f7      f8      f9      f10     f11
            1       2       3       4       5       6       7       8       9       0       -       =
            tab     q       w       e       r       t       u       i       o       p       [       ]
            caps    a       s       d       f       g       j       k       l       ;       '       \
                            x       c       v                       m       ,
                                    lalt    spc                     ralt
            )
            (defalias
              up (layer-toggle up)
              down (layer-toggle down)

              rdn (tap-hold-next-release 200 ret @down)
              ddn (tap-hold-next-release 200 del @down)
            )
            (deflayer base
            =       1       2       3       4       5       6       7       8       9       0       S-/
            tab     q       w       e       r       t       y       u       i       o       p       å
            esc     a       s       d       f       g       h       j       k       l       ö       ä
            '       z       x       c       v       b       n       m       ,       .       -       rctl
                            lmet    spc     @up                     @up     bspc
                                    lalt    @rdn                    @ddn
            )
            (deflayer up
            S-=     S-1     S-2     S-3     S-4     S-5     S-6     S-7     S-8     S-,     S-.     S-`
            S-tab   Q       W       E       R       T       Y       U       I       O       P       Å
            S-esc   A       S       D       F       G       H       J       K       L       Ö       Ä
            S-'     Z       X       C       V       B       N       M       ;       S-;     S--     S-rctl
                            S-lmet  S-spc   XX                      XX      S-bspc
                                    S-lalt  S-ret                   S-del
            )
            (deflayer down
            f12     f1      f2      f3      f4      f5      f6      f7      f8      f9      f10     f11
            tab     XX      XX      S-[     S-]     \    previoussong vold	volu nextsong   mute    caps
            esc     XX      XX      S-9     S-0     /       left    down    up      right playpause stop
            `       XX      XX      [       ]       S-\     home    pgdn    pgup    end     ins     ralt
                            lmet    spc     lsft                    rsft    bspc
                                    lalt    XX                      XX
            )
          '';
        };
      };
    };
  };
}
