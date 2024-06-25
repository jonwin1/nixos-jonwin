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
            esc     f1      f2      f3      f4      f5                      f6      f7      f8      f9      f10     f11
            1       2       3       4       5       6                       7       8       9       0       -       =
            tab     q       w       e       r       t                       u       i       o       p       [       ]
            caps    a       s       d       f       g                       j       k       l       ;       '       \
                            z       x       c       v       b       n       m       ,       .       /
                                                    lalt    spc     ralt    rmet
            )
            (defalias
              sft (layer-toggle sft)
              nav (layer-toggle nav)

              znav (tap-hold-next-release 200 z @nav)
              -nav (tap-hold-next-release 200 - @nav)
            )
            (deflayer base
            S-=     1       2       3       4       5                       6       7       8       9       0       =
            tab     q       w       e       r       t                       y       u       i       o       p       å
            esc     a       s       d       f       g                       h       j       k       l       ö       ä
            lctl    z       x       c       v       b                       n       m       ,       .       -       lalt
                            left    right   @nav    spc     @sft    @sft    bspc    @nav    down    up
                                                    lmet    ret     del     lmet
            )
            (deflayer sft
            S-/     S-1     S-2     S-3     S-4     S-5                     S-6     S-7     S-8     S-,     S-.     S-`
            S-tab   Q       W       E       R       T                       Y       U       I       O       P       Å
            S-esc   A       S       D       F       G                       H       J       K       L       Ö       Ä
            S-lctl  Z       X       C       V       B                       N       M       ;       S-;     S--     S-lalt
                            S-left  S-right @nav    S-spc   XX      XX      S-bspc  @nav    S-down  S-up
                                                    S-lmet  S-ret   S-del   S-lmet
            )
            (deflayer nav
            f12     f1      f2      f3      f4      f5                      f6      f7      f8      f9      f10     f11
            XX      '       S-[     S-]     \       XX                 previoussong vold    volu nextsong   mute    caps
            XX      S-'     S-9     S-0     /       XX                      left    down    up      right playpause stop
            XX      `       [       ]       S-\     XX                      home    pgdn    pgup    end     ins     ralt
                            left    right   XX      XX      XX      XX      XX      XX      down    up
                                                    XX      XX      XX      XX
            )
          '';
        };
      };
    };
  };
}
