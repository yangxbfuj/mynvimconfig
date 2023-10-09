require("mason").setup(
  {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
)

require("mason-lspconfig").setup(
  {
    -- 确保安装，根据需要填写
    ensure_installed = {
      "lua_ls",
      "jdtls",
      "volar",
      "jedi_language_server",
    }
  }
)
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {}
lspconfig.jdtls.setup{}

require("plugins/lsps/lsp-python")
require("plugins/lsps/lsp-vue")

