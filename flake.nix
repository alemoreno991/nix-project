{
  description = "Nixos config flake";
     
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     impermanence = {
       url = "github:nix-community/impermanence";
     };

    # lanzaboote = {
    #   url = "github:nix-community/lanzaboote/v0.4.2";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

     home-manager = {
       url = "github:nix-community/home-manager/release-24.11";
       inputs.nixpkgs.follows = "nixpkgs";
     };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     stylix.url = "github:danth/stylix/release-24.11";
     
  };

  outputs = {nixpkgs, ...} @ inputs:
  {
    nixosConfigurations.thermopylae = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        inputs.disko.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
        # inputs.lanzaboote.nixosModules.lanzaboote

        hosts/thermopylae/configuration.nix
              
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
