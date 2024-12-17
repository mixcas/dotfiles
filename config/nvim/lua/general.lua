---> General
-- Sets how many lines of history VIM has to remember
vim.opt.history = 1000

-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ","

-- Fast saving
vim.api.nvim_set_keymap("n","<leader>w",":w!<cr>",{})

-- Ignore case when Neovim completes file names and directories
vim.opt.wildignorecase = true

-- Use the system clipboard for all yank, delete, change, and put operations.
vim.opt.clipboard = "unnamedplus"
