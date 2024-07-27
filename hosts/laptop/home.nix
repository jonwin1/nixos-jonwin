{ ... }:
{
    imports = [
        ../../hm-modules/hyprland-laptop.nix
    ];
    services = {
        batsignal = {
            enable = true;
            extraArgs = [];
        };
    };
    # programs = {
    #     qutebrowser = {
    #         settings = {
    #             zoom.default = "125%";
    #         };
    #     };
    # };
}
