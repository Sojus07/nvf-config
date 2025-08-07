{
  description = "My autistic nvf config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      inherit pkgs;
      modules = [ ./default.nix ];
    }.nvim;
    
    nixosModules.default = { pkgs, lib, ... }: {
      imports = [
        nvf.nixosModules.default
      ];
      
      programs.nvf.settings = ./default.nix;
    };
  };
}

