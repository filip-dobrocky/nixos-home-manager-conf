{ lib, pkgs, ... }:
{
  # XDG desktop integration - sets default applications
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/x-terminal-emulator" = [ "org.wezfurlong.wezterm.desktop" ];
        "x-scheme-handler/terminal" = [ "org.wezfurlong.wezterm.desktop" ];
      };
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
  };
}