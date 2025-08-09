{ lib, pkgs, ... }:
{
  # XDG desktop integration - sets default applications
  xdg = {
    enable = true;
    
    # Configure XDG directories properly
    userDirs = {
      enable = true;
      createDirectories = true;
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
    };
    
    # Force desktop entry to ~/.local/share/applications/ for proper priority
    dataFile."applications/nvim.desktop".text = ''
      [Desktop Entry]
      Name=Neovim
      GenericName=Text Editor
      Comment=Edit text files
      Exec=wezterm start -- nvim %F
      Icon=nvim
      Terminal=false
      Type=Application
      Categories=Utility;TextEditor;
      MimeType=text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
      StartupNotify=false
    '';

    dataFile."applications/ranger.desktop".text = ''
      [Desktop Entry]
      Name=Ranger
      GenericName=File Manager
      Comment=Manage files
      Exec=wezterm start -- ranger %F
      Icon=ranger
      Terminal=false
      Type=Application
      Categories=Utility;FileManager;
      MimeType=application/x-directory;
      StartupNotify=false
    '';

    # Override Reaper to use X11
    dataFile."applications/cockos-reaper.desktop".text = ''
      [Desktop Entry]
      Encoding=UTF-8
      Type=Application
      Name=REAPER
      Comment=REAPER
      Categories=Audio;Video;AudioVideo;AudioVideoEditing;Recorder;
      Exec=env GDK_BACKEND=x11 "${pkgs.reaper}/opt/REAPER/reaper" %F
      Icon=cockos-reaper
      MimeType=application/x-reaper-project;application/x-reaper-project-backup;application/x-reaper-theme
      StartupWMClass=REAPER
    '';
  };

  # Add essential packages for proper file management including trash support
  home.packages = with pkgs; [
    glib           # For gsettings and GIO
    shared-mime-info  # MIME type detection
    desktop-file-utils  # Desktop file utilities
    xdg-utils      # XDG utilities
  ];
  

}