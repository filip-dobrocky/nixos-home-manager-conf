{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    polybar
    rofi
    i3status
    brightnessctl
    playerctl
    pavucontrol
    feh
  ];

  xdg.configFile."polybar/config.ini".text = ''
    [bar/main]
    width = 100%
    height = 36
    background = #282c34
    foreground = #cdd6f4
    font-0 = monospace:size=10;2
    modules-left = rofi weather i3
    modules-center = workspaces
    modules-right = tray battery pulseaudio microphone backlight cpu memory disk temperature network lock_screen power

    tray-position = right
    tray-padding = 10
    tray-background = #282c34

    [module/rofi]
    type = custom/text
    content = ""
    click-left = "rofi -show drun"

    [module/power]
    type = custom/text
    content = ""
    click-left = "wlogout"

    [module/lock_screen]
    type = custom/text
    content = ""
    click-left = "i3lock"

    [module/weather]
    type = custom/script
    exec = ~/.config/polybar/scripts/wttr.py
    interval = 3600

    [module/workspaces]
    type = internal/i3
    format = <label-state>
    label-focused = "%name%"
    label-unfocused = "%name%"
    label-visible = "%name%"
    label-urgent = "%name%"

    [module/tray]
    type = internal/tray

    [module/cpu]
    type = internal/cpu
    interval = 10
    format = " <label>"

    [module/memory]
    type = internal/memory
    interval = 30
    format = " <used>/<total>"

    [module/disk]
    type = internal/fs
    interval = 600
    mount-0 = /
    format-mounted = "󰋊 <used>/<total>"

    [module/temperature]
    type = internal/temperature
    thermal-zone = 1
    format = " <temperature>°C"
    warn-temperature = 70

    [module/battery]
    type = internal/battery
    battery = BAT0
    full-at = 95
    format-charging = " <percentage>%"
    format-discharging = "<percentage>%"
    format-full = " <percentage>%"
    format-low = " <percentage>%"
    format-icons =     

    [module/pulseaudio]
    type = internal/pulseaudio
    format-volume = " <volume>%"
    format-muted = " <volume>%"
    click-right = "pavucontrol"
    click-left = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
    scroll-down = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%-"

    [module/microphone]
    type = internal/pulseaudio
    sink = @DEFAULT_AUDIO_SOURCE@
    format-volume = " <volume>%"
    format-muted = " <volume>%"
    click-left = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+"
    scroll-down = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%-"

    [module/backlight]
    type = backlight
    card = intel_backlight
    format = "󰃞 <percent>%"
    scroll-up = "brightnessctl set +5%"
    scroll-down = "brightnessctl set 5%-"

    [module/network]
    type = internal/network
    interface = wlp2s0
    interval = 3
    format-connected = " <ip>"
    format-disconnected = ""

    [module/i3]
    type = internal/i3
    format = "<label>"

    [settings]
    screenchange-reload = true

    [global/wm]
    margin-right = 5
    margin-left = 5
  '';
}

