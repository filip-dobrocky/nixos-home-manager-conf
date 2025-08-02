{ lib, pkgs, ... }:
{
  # KeePassXC for password management and secret service
  home.packages = with pkgs; [
    keepassxc          # Password manager with 2FA support
    libsecret          # For secret service API
    seahorse           # GUI for managing secrets (optional)
    git-credential-manager
  ];

  # Enable secret service for applications
  services.secret-service = {
    enable = true;
  };

  # Session variables for secret service
  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };

  programs.git = {
    enable = true;
    userName = "Filip Dobrocky";  # Add your name
    userEmail = "filip.dobrocky@gmail.com";  # Add your email
    
    extraConfig = {
      credential = {
        helper = "manager";
        credentialStore = "secretservice";
      };
      "credential \"https://github.com\"" = {
        username = "filip-dobrocky";
      };
    };
  };
}