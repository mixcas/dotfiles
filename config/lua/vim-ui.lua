---> VIM user interface
-- Set 7 lines to the cursor - when moving vertically using j/k
vim.opt.so = 7

-- Turn on the WiLd menu
vim.opt.wildmenu = true

-- Set Wild Menu to list
vim.opt.wildmode = 'list:longest,full'

-- Ignore compiled files
vim.opt.wildignore = '*.o,*~,*.pyc'

-- Always show current position
vim.opt.ruler = true

-- Height of the command bar
-- vim.opt.cmdheight=1

-- A buffer becomes hidden when it is abandoned
-- vim.opt.hid = true

-- Configure backspace so it acts as it should act
vim.opt.backspace = 'eol,start,indent'
vim.opt.whichwrap:append('<,>,h,l')

-- Ignore case when searching
vim.opt.ignorecase = true

-- When searching try to be smart about cases
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- How many tenths of a second to blink when matching brackets
vim.opt.mat = 6
