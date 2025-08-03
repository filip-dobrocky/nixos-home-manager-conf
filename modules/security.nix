{ lib, pkgs, ... }:
{
  # KeePassXC for password management and secret service
  home.packages = with pkgs; [
    keepassxc          # Password manager with 2FA support
    libsecret          # For secret service API
    seahorse           # GUI for managing secrets (optional)
    git-credential-manager
  ];

  # Git configuration with hybrid approach
  programs.git = {
    enable = true;
    userName = "Filip Dobrocky";
    userEmail = "filip.dobrocky@gmail.com";
    
    extraConfig = {
      # Use GitHub CLI for GitHub authentication
      "credential \"https://github.com\"" = {
        helper = "!gh auth git-credential";
      };
      # Use cache for other git services as fallback
      credential = {
        helper = "cache --timeout=86400";  # 24 hours
      };
    };
  };

  # GitHub CLI for seamless GitHub authentication
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      prompt = "enabled";
    };
  };

  # GPG for signing commits and other security tasks
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gtk2;
    enableSshSupport = true;
  };
}