{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    i3lock
    polybar
    rofi
    xautolock
    i3status
    brightnessctl
    playerctl
    grimblast
    wezterm
    nautilus
  ];

  programs.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      fonts = {
        names = [ "monospace" ];
        size = 10.0;
      };

      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
        }
      ];

      keybindings = {
        "Mod4+Return" = "exec wezterm";
        "Mod4+Shift+Q" = "kill";
        "Mod1+F4" = "kill";
        "Mod4+E" = "exec nautilus";
        "Mod4+Shift+SPACE" = "floating toggle";
        "Mod4+TAB" = "exec rofi -show drun";
        "Mod4+L" = "exec i3lock";
        "Mod4+Shift+E" = "exec wlogout";
        "Mod4+Shift+R" = "restart";
        "Mod4+Shift+W" = "reload";
        "Mod4+P" = "layout tabbed";
        "Mod4+J" = "split v";
        "Mod4+Q" = "split h";
        "Mod4+S" = "scratchpad show";
        "Mod4+Shift+S" = "move scratchpad";
        "Mod4+1" = "workspace 1";
        "Mod4+2" = "workspace 2";
        "Mod4+3" = "workspace 3";
        "Mod4+4" = "workspace 4";
        "Mod4+5" = "workspace 5";
        "Mod4+6" = "workspace 6";
        "Mod4+7" = "workspace 7";
        "Mod4+8" = "workspace 8";
        "Mod4+9" = "workspace 9";
        "Mod4+0" = "workspace 10";
        "Mod4+Shift+1" = "move container to workspace 1";
        "Mod4+Shift+2" = "move container to workspace 2";
        "Mod4+Shift+3" = "move container to workspace 3";
        "Mod4+Shift+4" = "move container to workspace 4";
        "Mod4+Shift+5" = "move container to workspace 5";
        "Mod4+Shift+6" = "move container to workspace 6";
        "Mod4+Shift+7" = "move container to workspace 7";
        "Mod4+Shift+8" = "move container to workspace 8";
        "Mod4+Shift+9" = "move container to workspace 9";
        "Mod4+Shift+0" = "move container to workspace 10";
        "Mod4+Left" = "focus left";
        "Mod4+Right" = "focus right";
        "Mod4+Up" = "focus up";
        "Mod4+Down" = "focus down";
        "Mod4+Shift+Left" = "move left";
        "Mod4+Shift+Right" = "move right";
        "Mod4+Shift+Up" = "move up";
        "Mod4+Shift+Down" = "move down";
        "Mod4+Shift+C" = "reload";
        "Mod4+Shift+E" = "exit";
        "Mod4+Print" = "exec grimblast copy screen";
        "Shift+Print" = "exec grimblast save area ~/Pictures/Screenshots/";
        "Mod4+Shift+Print" = "exec grimblast save screen ~/Pictures/Screenshots/";
        "Print" = "exec grimblast copy area";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPause" = "exec playerctl play-pause";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioPrev" = "exec playerctl previous";
      };

      floatingModifier = "Mod4";

      gaps = {
        inner = 3;
        outer = 5;
      };

      exec = [
        # Polybar (replace with your polybar config if needed)
        "polybar example &"
        # Lock on suspend and after 10 min idle
        "${pkgs.xautolock}/bin/xautolock -time 10 -locker i3lock -detectsleep &"
      ];

      exec_always = [
        # Set wallpaper (example, if using feh)
        "feh --bg-scale ~/Pictures/wallpaper.png"
      ];
    };