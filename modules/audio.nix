{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    paulxstretch
  ];
}