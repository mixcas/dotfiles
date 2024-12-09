-- require("mason").setup();
--
-- require("mason-lspconfig").setup({});
--
-- local lspconfig = require('lspconfig')
-- lspconfig.tssserver.setup({});

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ast_grep",
    "bashls",
    "css_variables",
    "cssmodules_ls",
    "html",
    "eslint",
    -- "nginx_language_server",
  },
})
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
}

require("formatter").setup()
