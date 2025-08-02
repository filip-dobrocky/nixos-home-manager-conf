{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Base utilities
    starship
    parted

    # Documents
    zathura
    libreoffice

    # Development
    git-credential-manager
    hugo

    # Media
    ffmpeg
    vlc

    # Audio
    supercollider-with-plugins
    puredata
    reaper
  ];
}