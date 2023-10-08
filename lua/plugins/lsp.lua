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
      "pyright",
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
require("lspconfig").pyright.setup({
  capabilities = capabilities
})
require("lspconfig").vuels.setup({
  capabilities = capabilities
})
require("lspconfig").jdtls.setup({
  capabilities = capabilities
})
