{ user, inputs, ... }:
{
  home-manager.users.${user} = {

    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;

      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisablePocket = true;
        DisableTelemetry = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        PromptForDownloadLocation = true;

        SearchEngines = {
          Default = "SearXNG";
          Add = [
            {
              Name = "SearXNG";
              URLTemplate = "https://searxng.jonwin.se/search?q={searchTerms}";
              Alias = "@searx";
            }
            {
              Name = "NixOS Wiki";
              URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              Alias = "@nix";
            }
            {
              Name = "NixOS Packages";
              URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
              Alias = "@pkg";
            }
            {
              Name = "NixOS Options";
              URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
              Alias = "@opt";
            }
            {
              Name = "Home Manager Options";
              URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
              Alias = "@hmopt";
            }
            {
              Name = "Arch Wiki";
              URLTemplate = "https://wiki.archlinux.org/index.php?search={searchTerms}";
              Alias = "@arch";
            }
          ];
        };
      };
    };
  };
}
