{ lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Filip Dobrocky";  # Add your name
    userEmail = "filip.dobrocky@gmail.com";  # Add your email
    
    extraConfig = {
      credential = {
        helper = "manager";
        credentialStore = "secretservice";  # Use secret service instead of cache
      };
      "credential \"https://github.com\"" = {
        username = "filip-dobrocky";
      };
    };
  };

  # Install Git Credential Manager
  home.packages = with pkgs; [
    git-credential-manager
  ];

  # Enable GNOME Keyring service
  services.gnome-keyring = {
    enable = true;
    components = [ "secrets" "ssh" ];
  };

  # Set up environment for keyring
  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };
}