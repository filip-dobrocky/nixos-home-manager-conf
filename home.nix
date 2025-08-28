{ lib, pkgs, ... }:
{
  imports = [
    ./modules/packages.nix
    ./modules/appearance.nix
    ./modules/xdg.nix
    ./modules/hyprland.nix
    ./modules/i3.nix
    ./modules/polybar.nix
    ./modules/waybar.nix
    ./modules/python.nix
    ./modules/shell.nix
    ./modules/security.nix
    ./modules/audio.nix
  ];

  home = {
    username = "filip";
    homeDirectory = "/home/filip";
    stateVersion = "25.11";
    
    # Set default applications for desktop integration
    sessionVariables = {
      TERMINAL = "wezterm";
      TERM = "wezterm";
    };
  };
}
