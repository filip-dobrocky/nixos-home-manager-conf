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
    nix-index

    # Communication
    discord
    thunderbird

    # Documents
    zathura
    libreoffice

    # Development
    hugo
    vscode
    zed-editor
    gh-copilot
    gcc
    libgcc

    # Media
    ffmpeg
    vlc
    eog
    rhythmbox
    cheese
    spotify
    ocenaudio

    # Graphics
    gimp3-with-plugins
    inkscape
  ];
}
