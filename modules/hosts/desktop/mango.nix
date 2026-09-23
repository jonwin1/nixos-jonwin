{
  flake.wrappers.mangowc = {
    settings = {
      exec-once = [
        "mmsg dispatch focusmon,DP-1"
      ];

      monitorrule = [
        "make:AOC, model:U34G2G4R3, width:3440, height:1440, refresh:144, x:3840, y:720, scale:1"
        "make:Samsung Electric Company, model:QCQ90S, width:3840, height:2160, refresh:144, x:0, y:0, scale:1"
      ];
    };
  };
}
