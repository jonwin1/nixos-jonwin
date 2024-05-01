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

              elm (tap-hold-next-release 200 esc lmet)
              sct (tap-hold-next-release 200 spc lctl)
              ddown (tap-hold-next-release 200 del @down)
            )
            (deflayer base
            =       1       2       3       4       5       6       7       8       9       0       S-/
            tab     q       w       e       r       t       y       u       i       o       p       å
            '       a       s       d       f       g       h       j       k       l       ö       ä
            ret     z       x       c       v       b       n       m       ,       .       -       ralt
                            @elm    @sct    @up                     @up     bspc
                                    lalt    @down                   @ddown
            )
            (deflayer up
            S-=     S-1     S-2     S-3     S-4     S-5     S-6     S-7     S-8     S-,     S-.     S-`
            S-tab   Q       W       E       R       T       Y       U       I       O       P       Å
            S-'     A       S       D       F       G       H       J       K       L       Ö       Ä
            S-ret   Z       X       C       V       B       N       M       ;       S-;     S--     S-ralt
                            S-lmet  S-lctl  XX                      XX      S-bspc
                                    S-lalt  XX                      S-del
            )
            (deflayer down
            f12     f1      f2      f3      f4      f5      f6      f7      f8      f9      f10     f11
            tab     XX      XX      S-[     S-]     \    previoussong vold	volu nextsong   mute    caps
            `       XX      XX      S-9     S-0     /       left    down    up      right playpause stop
            ret     XX      XX      [       ]       S-\     home    pgdn    pgup    end     ins     ralt
                            lmet    spc     lsft                    rsft    bspc
                                    lalt    XX                      XX
            )
          '';
        };
      };
    };
  };
}
