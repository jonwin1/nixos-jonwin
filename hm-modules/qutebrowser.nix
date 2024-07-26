{
    programs = {
        qutebrowser = {
            enable = true;
            settings = {
                confirm_quit = [ "multiple-tabs" "downloads" ];
                fonts.default_size = "12pt";
                url = {
                    default_page = "https://searxng.jonwin.se/";
                    start_pages = "https://searxng.jonwin.se/";
                };
                content.autoplay = false;
            };
            searchEngines = { DEFAULT = "https://searxng.jonwin.se/search?q={}"; };
        };
    };
}
