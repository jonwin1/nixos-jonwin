{
  flake.wrappers.mangowc = {
    settings = {
      bind = [
          "super, t, toggle_trackpad_enable"
          "super+shift, t, toggle_monitor, make:California Institute of Technology&&model:0x160A"
      ];
      monitorrule = [
        "make:California Institute of Technology, model:0x160A, width:2560, height:1600, refresh:120, x:0, y:0, scale:1.6, vrr:1"

        # Hemma kontor
        "make:AOC, model:2460G5, serial:0x00002C61, width:1920, height:1080, refresh:75, x:1600, y:0, scale:1"
        "make:AOC, model:2460G5, serial:0x00025047, width:1920, height:1080, refresh:75, x:3520, y:0, scale:1"

        # TODO: convert to mango format
        # "desc:ASUSTek COMPUTER INC ASUS VP247 HALMTF188756, 1920x1080@75, 2560x0, 1"
        # "desc:AOC 2460G5 0x00011131, 1920x1080@75, 4480x0, 1"
      ];
    };
  };
}
