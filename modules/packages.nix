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

    # Communication
    discord
    thunderbird
    

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
    cheese
    spotify

    # Graphics
    gimp
    inkscape
  ];
}