{ lib, pkgs, ... }:
{
  imports = [
    ./modules/packages.nix
    ./modules/appearance.nix
    ./modules/xdg.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/python.nix
    ./modules/shell.nix
  ];

  home = {
    username = "filip";
    homeDirectory = "/home/filip";
    stateVersion = "25.11";
    
    # Set default applications for desktop integration
    sessionVariables = {
      TERMINAL = "wezterm";
      TERM = "wezterm";
      GTK_THEME = "Adwaita-dark";
    };
  };
}
