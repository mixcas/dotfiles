-- Setup Lazy, package manager:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Plugins list
require("lazy").setup({
  "ray-x/starry.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "ctrlpvim/ctrlp.vim",
  {
    "junegunn/fzf.vim",
    dependencies = { 
      "junegunn/fzf", 
      build = ":call fzf#install()" 
    },
  }, {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }, {
    "nvim-lualine/lualine.nvim",
    init = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right = ""},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {"filename"},
          lualine_x = {"encoding", "fileformat", "filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"location"},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  }, {
    "neoclide/coc.nvim",
    branch = "release",
    build = "yarn install --frozen-lockfile",
    -- TODO: find a way to autoinstall coc pacakges
    -- :CocInstall coc-css coc-tsserver coc-html coc-json coc-markdownlint coc-phpls coc-pyright coc-eslint                                                                                                                                                                  
  }, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "diff",
          "dockerfile",
          "dot",
          "git_config",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "make",
          "make",
          "php",
          "python",
          "regex",
          "regex",
          "scss",
          "sql",
          "sql",
          "tsx",
          "typescript",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  }
})

---> fzf
-- Make :Ag ignore node_modules
vim.g.ag_ignore = "node_modules"

---> CtrlP
vim.g.ctrlp_working_path_mode = 'ra'
