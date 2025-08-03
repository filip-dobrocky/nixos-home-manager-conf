{ lib, pkgs, ... }:
{
  # Enable Catppuccin theming (base configuration)
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
    
    # Enable for specific applications
    hyprland.enable = true;
    hyprlock.enable = true;
    wlogout.enable = true;
    waybar.enable = true;
    wezterm.apply = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
    package = pkgs.catppuccin-cursors.mochaDark;
  };

  # Improved GTK theming
  gtk = {
    enable = true;
    
    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "mocha";
      };
    };

    font = {
      name = "Inter";
      size = 11;
    };

    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-primary-button-warps-slider=0
    '';

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-enable-animations = 1;
      gtk-primary-button-warps-slider = 0;
      gtk-recent-files-max-age = 0;
      gtk-recent-files-limit = 0;
    };

    # GTK4 has different settings - remove the problematic ones
    gtk4.extraConfig = {

    };
  };

  # Qt theming to match GTK
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  # XDG settings for better app integration
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config.common.default = "hyprland;gtk";
    };
  };

  # Set dark mode for libadwaita apps using gsettings
  home.activation.setAdwaitaDarkMode = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  '';

  # Add essential services for GTK apps
  home.packages = with pkgs; [
    # GTK theme tools
    gtk-engine-murrine
    gtk_engines
    sushi  # File previewer for Nautilus
  ];

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      config.font = wezterm.font 'JetBrainsMono Nerd Font'
      config.font_size = 10
      config.enable_tab_bar = true
      return config
    '';
  };
}
