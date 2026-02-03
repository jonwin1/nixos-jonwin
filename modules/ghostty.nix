{ user, ... }:
{
  home-manager.users.${user}.programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    clearDefaultKeybinds = true;

    settings = {
      keybind = [
        "alt+space=toggle_command_palette"
        "alt+r=prompt_surface_title"

        # Clipboard
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        # Fontsize
        "alt+0=reset_font_size"
        "alt++=increase_font_size:1"
        "alt+-=decrease_font_size:1"

        # Scrolling
        "alt+u=scroll_page_up"
        "alt+d=scroll_page_down"
        "alt+n=jump_to_prompt:1"
        "alt+p=jump_to_prompt:-1"

        # Splits
        "alt+v=new_split:right"
        "alt+s=new_split:down"
        "alt+w=close_surface"
        "alt+enter=toggle_split_zoom"

        "alt+h=goto_split:left"
        "alt+j=goto_split:down"
        "alt+k=goto_split:up"
        "alt+l=goto_split:right"

        "ctrl+alt+h=resize_split:left,50"
        "ctrl+alt+j=resize_split:down,50"
        "ctrl+alt+k=resize_split:up,50"
        "ctrl+alt+l=resize_split:right,50"
        "ctrl+alt+0=equalize_splits"

        # Tabs
        "alt+t=new_tab"
        "alt+q=close_tab"

        "ctrl+tab=next_tab"
        "ctrl+shift+tab=previous_tab"

        "alt+1=goto_tab:1"
        "alt+2=goto_tab:2"
        "alt+3=goto_tab:3"
        "alt+4=goto_tab:4"
        "alt+5=goto_tab:5"
        "alt+6=goto_tab:6"
        "alt+7=goto_tab:7"
        "alt+8=goto_tab:8"
        "alt+9=last_tab"
      ];
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "simple"; # Fix dead keys (`^~'")
  };
}
