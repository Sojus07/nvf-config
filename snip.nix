{ pkgs, ... }: 
{
  vim = {
    snippets = {
      luasnip = {
        enable = true;
        loaders = "require('luasnip.loaders.from_snipmate').lazy_load()";
        setupOpts = {
          enable_autosnippets = false;
        };
      };
    };
  };
}
