local lspconfig = require('lspconfig')
lspconfig.jedi_language_server.setup{}

require("py_lsp").setup{
  language_server = "jedi_language_server",
  capabilities = capabilities,
  host_python = ".venv/bin",
  default_venv_name = ".venv"
}