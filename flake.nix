{
  description = "Home Manager configuration for filip";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    audio = {
      url = "github:filip-dobrocky/audio.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, audio, ... }: {
    homeConfigurations.filip = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      
      modules = [
        {
          nixpkgs.config.allowUnfree = true;
          nixpkgs.overlays = [ audio.overlays.default ];
        }
        
        # Import catppuccin module
        catppuccin.homeModules.catppuccin
        
        # Your home configuration
        ./home.nix
      ];
    };
  };
}
