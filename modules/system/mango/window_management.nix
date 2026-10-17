{
  flake.homeModules.mango = {
    wayland.windowManager.mango.settings = {
      # ---------- Layouts ----------

      # Scroller Layout
      scroller_structs = 25;
      scroller_default_proportion = 0.6;
      scroller_proportion_preset = "0.8,0.6,0.4";

      circle_layout = "tile,scroller,dwindle";

      # ---------- Rules ----------

      window_rule = [
        # Opacity
        "focused_opacity:1,unfocused_opacity:1,title:(.* - YouTube .*)"

        # Picture-in-Picture
        "is_floating:1,title:Picture-in-Picture"
        "is_global:1,title:Picture-in-Picture"
        "is_open_silent:1,title:Picture-in-Picture"
        "width:0.3,height:0.3,title:Picture-in-Picture"
        "offset_x:100,offset_y:-100,title:Picture-in-Picture"

        # Swallowing
        "is_term:1,app_id:com.mitchellh.ghostty"

        # Floating
        "is_floating:1,is_overlay:1,width:0.6,height:0.6,app_id:(thunar|com.yubico.yubioath|com.gabm.satty)"
        "is_floating:1,is_overlay:1,width:0.6,height:0.6,title:(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to (open|save).*|[C|c]hoose.*|.*file to save.*)"

        # Tearing
        "force_tearing:1,title:World of Warships"

        # Scroller proportion
        "scroller_proportion:0.4,app_id:com.mitchellh.ghostty"
      ];

      tag_rule = [
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
