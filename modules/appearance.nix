{ lib, pkgs, ... }:
{
  # Enable Catppuccin theming (base configuration)
  catppuccin = {
    enable = true;
    flavor = "mocha";  # Options: latte, frappe, macchiato, mocha
    accent = "flamingo";   # Options: blue, flamingo, green, lavender, maroon, mauve, peach, pink, red, rosewater, sapphire, sky, teal, yellow


    # Enable for specific applications
    starship.enable = true;
    hyprland.enable = true;
    wezterm.apply = true;
    vscode.profiles.default.enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "catppuccin-mocha-dark-cursors";  # Catppuccin cursor theme
    size = 16;
    package = pkgs.catppuccin-cursors.mochaDark;
  };

  # GTK theming - use alternative theme since Catppuccin GTK is archived
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";  # Use Adwaita dark as alternative
      package = pkgs.gnome-themes-extra;
    };
  };

  # Qt theming - this should still work
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    # enableNushellIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      config.font = wezterm.font 'JetBrainsMono Nerd Font'
      config.font_size = 10
      config.enable_tab_bar = true
      return config
    '';
  };
}