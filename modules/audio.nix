{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    supercollider-with-plugins
    puredata
    reaper
    audacity

    paulxstretch
    
    chow-kick

    # iem-plugin-suite
  ];
}