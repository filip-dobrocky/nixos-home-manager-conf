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
    file-roller
    code-nautilus
    nautilus-open-any-terminal

    # Communication
    discord
    thunderbird
    

    # Documents
    zathura
    libreoffice

    # Development
    hugo
    gh-copilot

    # Media
    ffmpeg
    vlc
    eog
    rhythmbox
    cheese
    spotify
    ocenaudio

    # Graphics
    gimp
    inkscape
  ];
}
