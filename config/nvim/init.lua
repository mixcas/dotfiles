require('plugins')
require('lsp-config')
require('general')
require('vim-ui')
require('moving')
require('starry-config')

-- vim.cmd [[colorscheme oceanic]]

---> Files, backups and undo
-- Turn backup off, since most stuff is in SVN, git et.c anyway...
vim.opt.writeany = false
vim.opt.swapfile = false

---> Text, tab and indent related
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Be smart when using tabs ;)
vim.opt.smarttab = true

-- 1 tab == 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Linebreak on 500 characters
-- vim.opt.lbr = true
-- vim.opt.tw = 500

vim.opt.ai = false -- Auto indent
vim.opt.smartindent = false
vim.opt.si = true -- Smart indent
vim.opt.wrap = true -- Wrap lines

vim.opt.ignorecase = true

-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Coc Tab completion
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true, noremap = true})

-- CtrlP
vim.cmd [[
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'
]]
