{
  pkgs,
  ...
}: {
  vim = {
    languages = {
      clang = {
        enable = true;
        lsp = {
          enable = true;
          server = "ccls";
        };
      };
      python = {
        enable = true;
        lsp.enable = true;
      };
      go = {
        enable = true;
        lsp.enable = true;
      };
      lua = {
        enable = true; 
      };
      rust = {
        enable = true;
        dap.enable = true;
        format.enable = true;
        lsp.enable = true;
      };
      bash = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      nix = {
        enable = true;
        extraDiagnostics = {
          enable = true;
        };
        format = {
          enable = true;
          type = "alejandra";
        };
        lsp.enable = true;
      };
    };
    lsp = {
      lspkind.enable = true;    
      trouble = {
        enable = true;
      };
    };
  };
}
