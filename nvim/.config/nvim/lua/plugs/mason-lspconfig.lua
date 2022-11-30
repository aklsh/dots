local servers = { 'bashls', 'texlab', 'rust_analyzer', 'pyright', 'sumneko_lua' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
  automatic_installation = false,
}
