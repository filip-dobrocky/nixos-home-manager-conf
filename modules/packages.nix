{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    starship
    parted

    # Development
    git-credential-manager
    hugo

    # Audio
    supercollider
    puredata
  ];
}