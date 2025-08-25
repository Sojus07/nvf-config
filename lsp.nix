{ pkgs, ... }: {
  vim = {
    snippets = {
      luasnip = {
        enable = true;
      };
    };
    languages = {
      nix = {
        enable = true;
        treesitter.enable = true;
        format = {
          enable = true;
          type = "alejandra";
          package = pkgs.alejandra;
        };
        extraDiagnostics = {
          enable = true;
          types = [ "statix" "deadnix" ];
        };
        lsp = {
          enable = true;
          package = pkgs.nixd;
          server = "nixd";
          options = {
            nixpkgs.expr = "import <nixpkgs> {}";
            nixos.expr = "(import <nixpkgs/nixos> {}).config";
            home.expr = "(import <home-manager> {}).config";
            formatting.command = [ "alejandra" ];
            eval.target = "nixosConfigurations.myhost.config.system.build.toplevel";
            diagnostics.suppressed = [ "unresolvedImport" "unusedBinding" ];
          };
        };
      };
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
    };
    lsp = {
      enable = true;
      lspkind.enable = true;
      trouble.enable = true;
      lspsaga.enable = true;
      lightbulb.enable = true;
    };
  };
}
