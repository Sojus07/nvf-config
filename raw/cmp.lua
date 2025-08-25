local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        path     = "[PATH]",
        buffer   = "[BUF]",
        nvim_lua = "[LUA]",
        luasnip  = "[SNIP]",
        nixpkgs  = "[NIX]",
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer" },
  }),

  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      function(entry1, entry2)
        if entry1.completion_item.label == entry2.completion_item.label then
          return entry1.source.name < entry2.source.name
        end
      end,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder,CursorLine:PmenuSel,Search:None",
    }),
  },

  mapping = cmp.mapping.preset.insert({
    ["<Down>"]  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Up>"]    = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<CR>"]    = cmp.mapping.confirm({ select = true }),
    ["<Tab>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"]   = cmp.mapping.abort(),
  }),
})

vim.cmd [[
  hi! CmpPmenu        guibg=NONE guifg=NONE
  hi! CmpPmenuBorder  guibg=NONE guifg=#555555
  hi! CmpDoc          guibg=NONE guifg=NONE
  hi! CmpDocBorder    guibg=NONE guifg=#555555
  hi! PmenuSel        guibg=#444444 guifg=NONE
]]
