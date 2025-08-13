{
  pkgs,
  ...
}: {
  imports = [
    ./lsp.nix
    ./terminal.nix
    ./neotree.nix
    ./cmp.nix
    ./lualine.nix
    ./snip.nix
    ./extraPlugins.nix
  ];
  vim = {
    extraLuaFiles = [
      (builtins.path {
        path = ./raw/opts.lua;
        name = "opts.lua";
      })
    ];
    autopairs.nvim-autopairs.enable = true;
    telescope.enable = true;
    theme = {
      enable = true;
      name = "oxocarbon";
      style = "dark";
    };
  };
}

