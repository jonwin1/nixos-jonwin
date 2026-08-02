{ self, inputs, ... }: {
  flake.nixosModules.zenBrowser = { config, ... }: {
    home-manager.users.${config.my.username}.imports = [
      self.homeModules.zenBrowser
    ];
  };

  flake.homeModules.zenBrowser = {
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
      };

      profiles.default = {
        search = {
          force = true;
          default = "SearXNG";

          engines = {
            SearXNG = {
              urls = [
                {
                  template = "https://searxng.jonwin.se/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@searx" ];
            };

            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "nixp" ];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "nixo" ];
            };

            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@nixw" ];
            };

            "Home Manager Options" = {
              urls = [
                {
                  template = "https://home-manager-options.extranix.com/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master";
                    }
                  ];
                }
              ];
              definedAliases = [ "hm" ];
            };
          };
        };
      };
    };
  };
}
