{ lib, pkgs, ... }:
{

  catppuccin.waybar = {
    enable = true;
    flavor = "mocha";  # Options: latte, frappe, macchiato, mocha
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 36;
        margin-right = 5;
        margin-left = 5;

        modules-left = [
          "custom/wofi"
          "custom/weather"
          "clock"
          "wlr/taskbar"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "tray"
          "battery"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "cpu"
          "memory"
          "disk"
          "temperature"
          "network"
          "hyprland/language"
          "custom/lock_screen"
          "custom/power"
        ];

        # Custom modules
        "custom/wofi" = {
          format = " ";
          on-click = "wofi --show drun";
          tooltip = false;
        };

        "custom/power" = {
          format = " ";
          on-click = "sysact";
          tooltip = false;
        };

        "custom/lock_screen" = {
          format = "";
          on-click = "sh -c '(hyprlock)' & disown";
          tooltip = false;
        };

        "custom/weather" = {
          tooltip = true;
          format = "{}";
          interval = 3600;
          exec = "~/.config/waybar/scripts/wttr.py";
          return-type = "json";
        };

        # Hyprland modules
        "hyprland/workspaces" = {
          on-click = "activate";
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          persistent-workspaces = {
            "*" = [ 1 2 3 4 ];
          };
        };

        "hyprland/language" = {
          format = "{}";
          on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
          format-en = "EN";
          format-fa = "FA";
        };

        # Other modules
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 12;
          all-outputs = true;
          tooltip-format = "{name}: {title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ "rofi" ];
        };

        tray = {
          icon-size = 12;
          spacing = 10;
        };

        cpu = {
          interval = 10;
          format = "";
          max-length = 10;
          format-alt-click = "click-right";
          format-alt = " {usage}%";
        };

        memory = {
          interval = 30;
          format = "";
          format-alt-click = "click-right";
          format-alt = " {}%";
          max-length = 10;
          tooltip = true;
          tooltip-format = "Memory - {used:0.1f}GB used";
        };

        disk = {
          interval = 600;
          format = "󰋊";
          path = "/";
          format-alt-click = "click-right";
          format-alt = "󰋊 {percentage_used}%";
          tooltip = true;
          tooltip-format = "HDD - {used} used out of {total} on {path} ({percentage_used}%)";
          states = {
            warning = 85;
            critical = 90;
          };
        };

        temperature = {
          thermal-zone = 1;
          format = "";
          format-alt-click = "click-right";
          format-alt = " {temperatureC}°C";
          critical-threshold = 70;
          format-critical = " {temperatureC}°C";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt-click = "click-right";
          format-alt = "{icon} {capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " {volume}%";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "pavucontrol";
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          tooltip = true;
          tooltip-format = "{icon} at {volume}%";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "";
          format-source-muted = "";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+";
          on-scroll-down = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%-";
          scroll-step = 5;
          tooltip = true;
          tooltip-format = " at {volume}%";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-alt-click = "click-right";
          format-alt = "{icon} {percent}%";
          format-icons = ["󰃞" "󰃟" "󰃠"];
          on-scroll-up = "brightnessctl -e4 -n2 set 5%+";
          on-scroll-down = "brightnessctl -e4 -n2 set 5%-";
        };

        network = {
          format = "{ifname}";
          format-wifi = " ";
          format-ethernet = " ";
          format-disconnected = " ";
          tooltip-format = " {ifname} via {gwaddr}";
          tooltip-format-wifi = " {essid} ({signalStrength}%)";
          tooltip-format-ethernet = " {ifname} {ipaddr}/{cidr}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        clock = {
          timezone = "Europe/Prague";
          format = "  {:%R  %d/%m}";
          tooltip = true;
          on-click = "setbg";
          tooltip-format = " {:%A,%e %B %Y}";
        };
      };
    };

    # Use your CSS as a fallback/override
    style = builtins.readFile ./waybar-style.css;
  };

  # Include the Python script
  xdg.dataFile."waybar/scripts/wttr.py" = {
    source = ./scripts/wttr.py;
    executable = true;
  };
}
