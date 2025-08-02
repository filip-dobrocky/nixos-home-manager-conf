{ lib, pkgs, ... }:
{
  programs.git = {
    extraConfig.credential.helper = "manager";  # Use Git Credential Manager
    extraConfig.credential."https://github.com".username = "FilipDobrocky";  # Set your GitHub username
    extraConfig.credential.credentialStore = "cache";
    enable = true;  
}