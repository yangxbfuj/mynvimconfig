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
      "vuels",
      "html",
      "tsserver",
      "jedi_language_server"
    }
  }
)
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities
}
require("lspconfig").jedi_language_server.setup{
  capabilities = capabilities,
}
require("py_lsp").setup{
  language_server = "jedi_language_server",
  capabilities = capabilities,
  host_python = ".venv/bin",
  default_venv_name = ".venv"
}
require("lspconfig").vuels.setup{
  capabilities = capabilities
}
require("lspconfig").jdtls.setup{
  capabilities = capabilities
}
