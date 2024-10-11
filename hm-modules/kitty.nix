{ pkgs, lib, ... }:
{
    programs.kitty = {
        enable = true;
        themeFile = "Nord";

        font = {
            package = pkgs.fira-code-nerdfont;
            name = "FiraCode Nerd Font";
            size = lib.mkDefault 11;
        };

        settings = {
            disable_ligatures = "cursor";
            scrollback_lines = 5000;
            scrollback_fill_enlarged_window = "yes";
            enable_audio_bell = "no";

            enabled_layouts = "Grid, Fat, Tall";
            tab_bar_style = "slant";
            background_opacity = "0.85";
            notify_on_cmd_finish = "invisible 15";

            clear_all_shortcuts = "yes";
        };

        keybindings = {
            # Copy/Paste
            "alt+c" = "copy_to_clipboard";
            "ctrl+shift+c" = "copy_to_clipboard";
            "ctrl+c" = "copy_and_clear_or_interrupt";
            "alt+v" = "paste_from_clipboard";
            "ctrl+shift+v" = "paste_from_clipboard";

            # Scrolling
            "alt+up" = "scroll_line_up";
            "alt+down" = "scroll_line_down";
            "alt+k" = "scroll_line_up";
            "alt+j" = "scroll_line_down";
            "alt+page_up" = "scroll_page_up";
            "alt+page_down" = "scroll_page_down";
            "alt+home" = "scroll_home";
            "alt+end" = "scroll_end";
            "alt+z" = "scroll_to_prompt -1";
            "alt+x" = "scroll_to_prompt 1";
            "alt+s" = "show_scrollback";
            "alt+d" = "show_last_command_output";

            # Windows
            "alt+w" = "new_window";
            "alt+shift+w" = "close_window";
            "alt+l" = "next_window";
            "alt+h" = "previous_window";
            "alt+shift+l" = "move_window_forward";
            "alt+shift+h" = "move_window_backward";
            "alt+r" = "start_resizing_window";
            "alt+m" = "toggle_layout stack";

            "alt+shift+1" = "first_window";
            "alt+shift+2" = "second_window";
            "alt+shift+3" = "third_window";
            "alt+shift+4" = "fourth_window";
            "alt+shift+5" = "fifth_window";
            "alt+shift+6" = "sixth_window";
            "alt+shift+7" = "seventh_window";
            "alt+shift+8" = "eight_window";
            "alt+shift+9" = "ninth_window";
            "alt+shift+0" = "tenth_window";

            # Tabs
            "alt+t" = "new_tab";
            "alt+shift+t" = "close_tab";
            "alt+right" = "next_tab";
            "alt+left" = "previous_tab";
            "alt+shift+r" = "set_tab_title";

            "alt+1" = "goto_tab 1";
            "alt+2" = "goto_tab 2";
            "alt+3" = "goto_tab 3";
            "alt+4" = "goto_tab 4";
            "alt+5" = "goto_tab 5";
            "alt+6" = "goto_tab 6";
            "alt+7" = "goto_tab 7";
            "alt+8" = "goto_tab 8";
            "alt+9" = "goto_tab 9";
            "alt+0" = "goto_tab 10";

            # Font Size
            "alt+plus" = "change_font_size current +2.0";
            "alt+kp_add" = "change_font_size current +2.0";
            "alt+minus" = "change_font_size current -2.0";
            "alt+kp_subtract" = "change_font_size current -2.0";
            "alt+equal" = "change_font_size current 0";
            "alt+backspace" = "change_font_size current 0";

            # Hints
            "alt+e" = "open_url_with_hints";
            "alt+p>f" = "kitten hints --type path --program -";
            "alt+p>shift+f" = "kitten hints --type path";
            "alt+p>l" = "kitten hints --type line --program -";
            "alt+p>w" = "kitten hints --type word --program -";
            "alt+p>h" = "kitten hints --type hash --program -";
            "alt+p>n" = "kitten hints --type linenum";
            "alt+p>y" = "kitten hints --type hyperlink";

            # Misc
            "alt+u" = "kitten unicode_input";
            "alt+escape" = "kitty_shell window";
        };
    };
}
