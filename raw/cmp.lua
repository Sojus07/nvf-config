local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        path     = "[PATH]",
        nvim_lua = "[LUA]",
      })[entry.source.name]
      return vim_item
    end,
  },

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
    ["<Left>"]  = cmp.mapping.abort(),
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
