{ pkgs, config, ... }:
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        font = "FiraCode Nerd Font 12";
        location = "center";
        theme = let
            # Use `mkLiteral` for string-like values that should show without
            # quotes, e.g.:
            # {
            #   foo = "abc"; => foo: "abc";
            #   bar = mkLiteral "abc"; => bar: abc;
            # };
            inherit (config.lib.formats.rasi) mkLiteral;
        in {
            # https://github.com/newmanls/rofi-themes-collection/blob/master/themes/rounded-common.rasi
            # https://github.com/newmanls/rofi-themes-collection/blob/master/themes/rounded-nord-dark.rasi

            "*" = {
                bg0 = mkLiteral "#2e3440F2";
                bg1 = mkLiteral "#3b4252";
                fg0 = mkLiteral "#D8DEE9";
                fg1 = mkLiteral "#4c566a";
                ac = mkLiteral "#81A1C1";

                background-color = mkLiteral "transparent";
                text-color = mkLiteral "@fg0";

                margin = 0;
                padding = 0;
                spacing = 0;
            };
            
            "window" = {
                location = mkLiteral "center";
                width = 640;

                border-radius = 24;
                border-color = mkLiteral "@ac";

                background-color = mkLiteral "@bg0";
            };

            "mainbox" = {
                padding = mkLiteral "12px";
            };

            "inputbar" = {
                background-color = mkLiteral "@bg1";

                border = mkLiteral "2px";
                border-color = mkLiteral "@ac";
                border-radius = mkLiteral "16px";

                padding = mkLiteral "8px 16px";
                spacing = mkLiteral "8px";
                children = map mkLiteral [ "prompt" "entry" ];
            };

            "entry"  = {
                placeholder = "Search";
                placeholder-color = mkLiteral "@fg1";
            };

            "message" = {
                margin = mkLiteral "8px 0 0";
                border = mkLiteral "2px";
                border-radius = mkLiteral "16px";
                border-color = mkLiteral "@ac";
                background-color = mkLiteral "@bg1";
            };

            "textbox" = {
                padding = mkLiteral "8px 24px";
            };

            "listview" = {
                background-color = mkLiteral "transparent";
                margin = mkLiteral "12px 0 0";
                lines = 8;
                columns = 1;
                fixed-height = false;
            };
            
            "element" = {
                padding = mkLiteral "8px 16px";
                spacing = mkLiteral "8px";
                border-radius = mkLiteral "16px";
            };
            
            "element selected" = {
                text-color = mkLiteral "@bg1";
            };

            "element normal active" = {
                text-color = mkLiteral "@ac";
            };

            "element alternate active" = {
                text-color = mkLiteral "@ac";
            };

            "element selected normal" = {
                background-color = mkLiteral "@ac";
            };

            "element selected active" = {
                background-color = mkLiteral "@ac";
            };

            "element-icon"  = {
                size = mkLiteral "1em";
                vertical-align = mkLiteral "0.5";
            };

            "element-text" = {
                text-color = mkLiteral "inherit";
            };
        };
    };
}
