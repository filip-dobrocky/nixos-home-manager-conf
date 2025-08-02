{
  description = "Home Manager configuration for filip";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }: {
    homeConfigurations.filip = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      
      modules = [
        # Enable unfree packages
        {
          nixpkgs.config.allowUnfree = true;
        }
        
        # Import catppuccin module
        catppuccin.homeModules.catppuccin
        
        # Your home configuration
        ./home.nix
      ];
    };
  };
}
