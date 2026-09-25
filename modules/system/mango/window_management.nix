{
  flake.wrappers.mangowc = {
    settings = {
      # ---------- Layouts ----------

      # Scroller Layout
      scroller_structs = 25;
      scroller_default_proportion = 0.6;
      scroller_proportion_preset = "0.8,0.6,0.4";

      circle_layout = "tile,scroller,dwindle";

      # ---------- Rules ----------

      windowrule = [
        # Opacity
        "focused_opacity:1,unfocused_opacity:1,title:(.* - YouTube .*)"

        # Picture-in-Picture
        "isfloating:1,title:Picture-in-Picture"
        "isglobal:1,title:Picture-in-Picture"
        "isopensilent:1,title:Picture-in-Picture"
        "width:0.3,height:0.3,title:Picture-in-Picture"
        "offsetx:100,offsety:-100,title:Picture-in-Picture"

        # Swallowing
        "isterm:1,appid:com.mitchellh.ghostty"

        # Floating
        "isfloating:1,isoverlay:1,width:0.6,height:0.6,appid:(thunar|com.yubico.yubioath|com.gabm.satty)"
        "isfloating:1,isoverlay:1,width:0.6,height:0.6,title:(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to (open|save).*|[C|c]hoose.*|.*file to save.*)"

        # Tearing
        "force_tearing:1,title:World of Warships"

        # Scroller proportion
        "scroller_proportion:0.4,appid:com.mitchellh.ghostty"
      ];

      tagrule = [
        "id:1,layout_name:scroller"
        "id:2,layout_name:scroller"
        "id:3,layout_name:scroller"
        "id:4,layout_name:scroller"
        "id:5,layout_name:scroller"
        "id:6,layout_name:scroller"
        "id:7,layout_name:scroller"
        "id:8,layout_name:scroller"
        "id:9,layout_name:scroller"
      ];
    };
  };
}
