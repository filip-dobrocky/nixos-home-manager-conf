{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Base utilities
    starship
    parted
    neofetch
    lshw
    grimblast
    wl-clipboard

    # Documents
    zathura
    libreoffice

    # Development
    hugo

    # Media
    ffmpeg
    vlc
    eog
    rhythmbox

    # Graphics
    gimp
    inkscape

    # Audio
    supercollider-with-plugins
    puredata
    reaper
    audacity
  ];
}