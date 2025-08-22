vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.relativenumber = true

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = "\\"
map('n', '<c-t>', ":ToggleTerm size=15<CR>", opts)
map('n', '<c-n>', ":Neotree filesystem reveal toggle<CR>", opts)
map('v', '<Tab>', '>gv', opts)
map('v', '<S-Tab>', '<gv', opts)
map('n', '<leader>ff', 'Telescope find_files<CR>', opts)
map('n', '<leader>gs', 'Telescope grep_string<CR>', opts)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#5c6370", bg = "NONE", italic = true })

vim.cmd [[
  set nobackup
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall 
  
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
]]

