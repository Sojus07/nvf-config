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
      name = "base16";
      base16-colors = {
        base00 = "#090a0a";
        base01 = "#3C3E41";
        base02 = "#403F40";
        base03 = "#3F4043";
        base04 = "#4A4B4F";
        base05 = "#b6b7b7";
        base06 = "#7f8080";
        base07 = "#b6b7b7";
        base08 = "#3C3E41";
        base09 = "#403F40";
        base0A = "#3F4043";
        base0B = "#4A4B4F";
        base0C = "#5E5F61";
        base0D = "#69696A";
        base0E = "#b6b7b7";
        base0F = "#7f8080";
      }; 
    };
  };
}

