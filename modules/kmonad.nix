{ lib, pkgs, ... }:
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
              sft (layer-toggle sft)
              nav (layer-toggle nav)

              rtnv (tap-hold-next-release 200 ret @nav)
              znav (tap-hold-next-release 200 z @nav)
              -nav (tap-hold-next-release 200 - @nav)
            )
            (deflayer base
            =       1       2       3       4       5                       6       7       8       9       0       S-/
            tab     q       w       e       r       t                       y       u       i       o       p       å
            esc     a       s       d       f       g                       h       j       k       l       ö       ä
            '       @znav   x       c       v       b                       n       m       ,       .       @-nav   del
                                            lmet    spc     @sft    @sft    bspc
                                                    lalt    lctl    @rtnv
            )
            (deflayer sft
            S-=     S-1     S-2     S-3     S-4     S-5                     S-6     S-7     S-8     S-,     S-.     S-`
            S-tab   Q       W       E       R       T                       Y       U       I       O       P       Å
            S-esc   A       S       D       F       G                       H       J       K       L       Ö       Ä
            S-'     Z       X       C       V       B                       N       M       ;       S-;     S--     S-del
                                            S-lmet  S-spc   XX      XX      S-bspc
                                                    S-lalt  S-lctl  S-ret
            )
            (deflayer nav
            f12     f1      f2      f3      f4      f5                      f6      f7      f8      f9      f10     f11
            XX      XX      XX      S-[     S-]     \                    previoussong vold	volu nextsong   mute    caps
            XX      XX      XX      S-9     S-0     /                       left    down    up      right playpause stop
            `       XX      XX      [       ]       S-\                     home    pgdn    pgup    end     ins     ralt
                                            XX      XX      XX      XX      XX
                                                    XX      XX      XX
            )
          '';
        };
      };
    };
  };
}
