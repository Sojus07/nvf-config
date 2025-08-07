{
  description = "My autistic nvf config";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    nvimWrapped = nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [ ./default.nix ];
    };
  in {
    packages.${system}.nvim = nvimWrapped.neovim;
    nixosModules.default = { pkgs, lib, ... }: {
      imports = [ nvf.nixosModules.default ];
      programs.nvf.settings = import ./default.nix;
    };
  };
}

