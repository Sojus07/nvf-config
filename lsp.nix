{
  pkgs,
  ...
}: {
  vim = {
    languages = {
      clang = {
        enable = true;
        lsp.server = "ccls"; 
      };
      python = {
        enable = true;
        lsp.enable = true;
        format = {
          enable = true;
          type = "ruff";        
        };
      };
      go = {
        enable = true;
        lsp.enable = true;
        format.enable = true;
      };
      lua = {
        enable = true;
        lsp.enable = true;
        format.enable = true;
      };
      rust = {
        enable = true;
        lsp.enable = true;
        format.enable = true;
        dap.enable = true;
      };
      bash = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      nix = {
        enable = true;
        lsp.enable = true;
        format = {
          enable = true;
          type = "alejandra"; 
        };
        extraDiagnostics.enable = true;
      };
    };
    lsp = {
      lspkind.enable = true;
      trouble.enable = true;
      lspsaga.enable = true; 
    };
  };
}
