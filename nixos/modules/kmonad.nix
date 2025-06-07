{
    services.kmonad = {
        enable = true;
        keyboards = {
            lgpro = {
                device = "/dev/input/by-id/usb-Logitech_PRO_Gaming_Keyboard_076D31413931-event-kbd";
                config = ''
(defcfg
    input (device-file "/dev/input/by-id/usb-Logitech_PRO_Gaming_Keyboard_076D31413931-event-kbd")
    output (uinput-sink "kmonad output")
    fallthrough true
)
(defsrc
    q       w       e       r       t       y       u       i       o       p       [
    a       s       d       f       g       h       j       k       l       ;       '
            z       x       c       v       b       n       m       ,       .       /
                                            spc
)
(defalias
    ssym (tap-hold-next-release 200 spc (layer-toggle sym))
)
(deflayer base
    q       w       e       r       t       y       u       i       o       p       [
    a       s       d       f       g       h       j       k       l       ;       '
            z       x       c       v       b       n       m       ,       .       /
                                            @ssym
)
(deflayer sym
    \       RA-7    RA-0    RA--    S-6     XX      -       S-0     S-\     RA-]    XX
    S-2     S-8     S-9     S-7     S-5     XX      S-1     RA-2    S-3     RA-4    XX
            S-=     RA-8    RA-9    RA-lsgt XX      XX      S--     lsgt    S-lsgt  S-]
                                            XX
)
'';
            };
        };
    };
}
