{ user, ... }:
{
  home-manager.users.${user}.programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;

    settings = {
      keybind = [
        "shift+alt+n=new_window"

        "alt+c=copy_to_clipboard"
        "ctrl+shift+c=copy_to_clipboard"
        "alt+v=paste_from_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        ## Fontsize
        "alt+zero=reset_font_size"
        "alt+plus=increase_font_size:1"
        "alt+minus=decrease_font_size:1"

        ## Scrolling
        "alt+u=scroll_page_up"
        "alt+d=scroll_page_down"
        "alt+n=jump_to_prompt:1"
        "alt+p=jump_to_prompt:-1"

        # Splits
        "alt+s=new_split:auto"
        "alt+q=close_window"
        "alt+enter=toggle_split_zoom"

        "alt+k=goto_split:up"
        "alt+j=goto_split:down"
        "alt+h=goto_split:left"
        "alt+l=goto_split:right"

        "shift+alt+k=resize_split:up,10"
        "shift+alt+j=resize_split:down,10"
        "shift+alt+h=resize_split:left,10"
        "shift+alt+l=resize_split:right,10"
        "shift+alt+equal=equalize_splits"

        # Tabs
        "alt+t=new_tab"
        "alt+w=close_tab"

        "alt+one=goto_tab:1"
        "alt+two=goto_tab:2"
        "alt+three=goto_tab:3"
        "alt+four=goto_tab:4"
        "alt+five=goto_tab:5"
        "alt+six=goto_tab:6"
        "alt+seven=goto_tab:7"
        "alt+eight=goto_tab:8"
        "alt+nine=last_tab"
      ];
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "simple"; # Fix dead keys (`^~'")
  };
}
