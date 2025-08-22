{
  pkgs,
  ...
}: {
  vim = {
    extraLuaFiles = [
      (builtins.path {
        path = ./raw/cmp.lua;
        name = "cmp-config-raw";
      })
    ];
    
    autocomplete = {
      nvim-cmp = {
        enable = true;
        sources = {
          nvim_lsp = "[LSP]";
          path     = "[PATH]";
          nvim_lua = "[LUA]";
        };
          
        sourcePlugins = with pkgs.vimPlugins; [
          cmp-nvim-lsp
          cmp-path
          cmp-nvim-lua
        ];
      };
    };
  };
}

