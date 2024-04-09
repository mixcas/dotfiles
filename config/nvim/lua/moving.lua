---> Moving around, tabs, windows and buffers
-- Disable highlight when <leader><cr> is pressed
vim.api.nvim_set_keymap('n', '<leader><cr>', ':noh<cr>', {silent = true, noremap = true})

-- Smart way to move between windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', {noremap = true})


-- Return to last edit position when opening files (You want this!)
vim.cmd[[autocmd BufReadPost * 
  \ if line("'\"") > 0 && line("'\"") <= line("$") | 
  \   exe "normal! g`\"" | 
  \ endif]]

-- Remap VIM 0 to first non-blank character
vim.api.nvim_set_keymap('n', '0', '^', {noremap = true})
