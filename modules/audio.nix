{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    supercollider-with-sc3-plugins
    puredata
    reaper
    audacity
    carla

    lsp-plugins

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