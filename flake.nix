{
  description = "My autistic nvf config";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }: {
    nixosModules.default = { pkgs, lib, ... }: {
      imports = [ nvf.nixosModules.default ];
      programs.nvf.settings = import ./default.nix;
    };
  };
}

