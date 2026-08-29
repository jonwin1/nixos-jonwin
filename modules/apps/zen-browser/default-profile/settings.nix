{
  flake.homeModules.zenBrowser = {
    programs.zen-browser.profiles.default.settings = {
      "zen.tabs.select-recently-used-on-close" = false;
      "zen.tabs.show-newtab-vertical" = false;
      "zen.welcome-screen.seen" = true;
      "zen.window-sync.sync-only-pinned-tabs" = true;
      "zen.view.sidebar-expanded" = true;
      "zen.view.use-single-toolbar" = true;

      "privacy.trackingprotection.allow_list.baseline.enabled" = true;

      "network.trr.mode" = 3;
      "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
      "network.trr_ui.fallback_was_checked" = true;

      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_ever_enabled" = true;
    };
  };
}
