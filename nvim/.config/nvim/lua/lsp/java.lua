require'lspconfig'.jdtls.setup{
   cmd = { 'jdtls' },
   root_dir = function(fname)
      return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
   end,
   on_attach = require('plugs.nvim-lspconfig').on_attach
}
