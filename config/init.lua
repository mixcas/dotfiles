require('plugins')
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
vim.opt.lbr = true
vim.opt.tw = 500

vim.opt.ai = true -- Auto indent
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
-- vim.g.ctrlp_custom_ignore = "node_modules"

--[===[
vim.api.nvim_set_keymap(
  "i",
  "<Tab>",
  'coc#pum#visible() ? coc#pum#next(0) : v:lua.check_back_space() ? "\\<Tab>" : coc#refresh()',
  {
    noremap = true,

  }
)
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(0) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
]===]--

