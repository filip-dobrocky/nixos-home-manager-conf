{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    supercollider-with-plugins
    puredata
    reaper
    audacity

    paulxstretch
    
    chow-kick
    chow-multitool
    chow-phaser
    chow-centaur
    chow-tape-model

    vital

    iem-plugin-suite
    mcfx

    plugdata

    (plugincollider.override {
      enableDynamicPlugins = true;
    })
  ];
}