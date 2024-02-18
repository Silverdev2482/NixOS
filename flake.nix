{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      Desktop-SD = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
	  ./configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager = {
	      useGlobalPkgs = true;
	      useUserPackages = true;
              extraSpecialArgs = inputs;
              users.silverdev2482 = import ./home.nix;
	    };
	  }
	];
      };   
    };
  };
}

