local config = {
  border = true, -- Split window borders
  hide_eob = false, -- Hide end of buffer
  italics = {
    comments = true, -- Italic comments
    strings = true, -- Italic strings
    keywords = false, -- Italic keywords
    functions = false, -- Italic functions
    variables = false -- Italic variables
  },

  contrast = { -- Select which windows get the contrast background
    enable = true, -- Enable contrast
    terminal = true, -- Darker terminal
    filetypes = {}, -- Which filetypes get darker? e.g. *.vim, *.cpp, etc.
  },

  text_contrast = {
    lighter = true, -- Higher contrast text for lighter style
    darker = true -- Higher contrast text for darker style
  },

  disable = {
    background = false, -- true: transparent background
    term_colors = false, -- Disable setting the terminal colors
    eob_lines = false -- Make end-of-buffer lines invisible
  },

  style = {
    name = 'deepocean', -- Theme style name (moonlight, earliestsummer, etc.)
    -- " other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
    disable = {},  -- a list of styles to disable, e.g. {'bold', 'underline'}
    fix = true,
    darker_contrast = false, -- More contrast for darker style
    daylight_swith = true, -- Enable day and night style switching
    deep_black = false, -- Enable a deeper black background
  },

  -- custom_colors = {
  --   variable = '#f797d7',
  -- },
  --
  -- custom_highlights = {
  --   LineNr = { fg = '#777777' },
  --   Idnetifier = { fg = '#ff4797' },
  -- }
}
require('starry').setup(config)
vim.cmd('colorscheme deepocean')
