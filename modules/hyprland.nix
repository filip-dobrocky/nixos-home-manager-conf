{ lib, pkgs, ... }:
{
  # Move Catppuccin config to module level
  catppuccin.hyprland = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  # Hyprland configuration - converted from ~/.config/hypr/hyprland.conf
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    
      # Monitors
      monitor = [
        "eDP-1,1920x1080,0x0,1"
        ",preferred,0x-1080,auto"
      ];
      
      # Programs
      "$terminal" = "wezterm";
      "$fileManager" = "nautilus";
      "$menu" = "pgrep -x wofi >/dev/null 2>&1 || wofi --dmenu --show drun";
      "$mainMod" = "SUPER";
      
      # Autostart - Add delay to waybar to let theme load first
      "exec-once" = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
        "sleep 2 && waybar"  # Add delay
      ];
      
      # Environment variables
      env = [
        "XCURSOR_SIZE,16"
        "HYPRCURSOR_SIZE,16"
        "XCURSOR_THEME,catppuccin-mocha-dark-cursors"  # Use catppuccin cursor
        "TERMINAL,wezterm"
        "TERM,wezterm"
      ];
      
      # General settings - Remove manual colors to let Catppuccin apply
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      
      # Decoration
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # Remove manual shadow color to let Catppuccin apply:
          # color = "rgba(1a1a1aee)";
        };
        
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      
      # Animations
      animations = {
        enabled = true;
        
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      
      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      
      # Master layout
      master = {
        new_status = "master";
      };
      
      # Misc
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      
      # Input
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        numlock_by_default = true;
        
        touchpad = {
          natural_scroll = false;
        };
      };
      
      # Gestures
      gestures = {
        workspace_swipe = false;
      };
      
      # Per-device config
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      
      # Key bindings
      bind = [
        # Basic binds
        "$mainMod, Return, exec, $terminal"
        "$mainMod SHIFT, Q, killactive"
        "ALT, F4, killactive"
        "$mainMod SHIFT, E, exit"
        "$mainMod, E, exec, $fileManager"
        "$mainMod SHIFT, SPACE, togglefloating"
        "$mainMod, TAB, exec, $menu"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"
        
        # Hyprland config reload
        "$mainMod SHIFT, R, exec, hyprctl reload"
        
        # Waybar restart keybind for debugging
        "$mainMod SHIFT, W, exec, pkill waybar && sleep 1 && waybar &"
        
        # Move focus with arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        
        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        
        # Move active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        
        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        
        # Scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      
      # Volume and brightness keys
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      
      # Media keys
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      
      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      
      # Window rules
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}