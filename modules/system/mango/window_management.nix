{
  flake.wrappers.mangowc = {
    settings = {
      # ---------- Layouts ----------

      # Scroller Layout
      scroller_default_proportion = 0.6;
      scroller_proportion_preset = "0.5,0.6,0.75,1.0";

      circle_layout = "tile,scroller,fair,dwindle,center_tile,right_tile,vertical_scroller";

      # ---------- Rules ----------

      windowrule = [
        # Opacity
        "focused_opacity:1,unfocused_opacity:0.97,appid:zen-beta"
        "focused_opacity:1,unfocused_opacity:1,title:(.* - YouTube .*)"
        "focused_opacity:0.95,unfocused_opacity:0.9,appid:com.mitchellh.ghostty"

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
      ];

      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];
    };
  };
}
