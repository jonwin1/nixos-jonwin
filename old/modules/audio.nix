{
  services = {
    pipewire = {
      extraConfig.pipewire-pulse."12-audio-crackling" = {
        "pulse.properties" = {
          "pulse.min.req" = "256/48000";
          "pulse.min.frag" = "256/48000";
          "pulse.min.quantum" = "256/48000";
        };
      };
    };
  };
}
